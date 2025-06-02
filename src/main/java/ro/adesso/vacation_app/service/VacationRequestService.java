package ro.adesso.vacation_app.service;

import jakarta.persistence.EntityNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.util.Streamable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import ro.adesso.vacation_app.config.JwtInterceptor;
import ro.adesso.vacation_app.dto.VacationRequestDTO;
import ro.adesso.vacation_app.dto.mapper.UserMapper;
import ro.adesso.vacation_app.dto.mapper.VacationMapper;
import ro.adesso.vacation_app.exception.VacationRequestException;
import ro.adesso.vacation_app.model.User;
import ro.adesso.vacation_app.model.VacationRequest;
import ro.adesso.vacation_app.model.VacationRequestStatus;
import ro.adesso.vacation_app.repository.UserRepository;
import ro.adesso.vacation_app.repository.VacationRequestRepository;
import ro.adesso.vacation_app.util.PublicHolidayProvider;
import ro.adesso.vacation_app.util.WeekendProvider;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

@Service
public class VacationRequestService {

    private final VacationRequestRepository repository;
    private final UserRepository userRepository;
    private JwtInterceptor jwtInterceptor;
    private final VacationMapper vacationMapper;
    private final UserMapper userMapper;
    private final PublicHolidayProvider publicHolidayProvider;
    private final WeekendProvider weekendProvider;
    private static final Logger logger = LoggerFactory.getLogger(VacationRequestService.class);
    @Value("${security.roles.admin}")
    private String ROLE_ADMIN;

    public VacationRequestService(
            VacationRequestRepository repository, UserRepository userRepository, JwtInterceptor jwtInterceptor,
            VacationMapper vacationMapper,
            UserMapper userMapper,
            PublicHolidayProvider publicHolidayProvider,
            WeekendProvider weekendProvider) {
        this.repository = repository;
        this.userRepository = userRepository;
        this.jwtInterceptor = jwtInterceptor;
        this.vacationMapper = vacationMapper;
        this.userMapper = userMapper;
        this.publicHolidayProvider = publicHolidayProvider;
        this.weekendProvider = weekendProvider;
    }

    public VacationRequestDTO createVacation(VacationRequestDTO vacation) {
        VacationRequest vacationRequest = new VacationRequest();
        vacationRequest.setStartDate(vacation.getStartDate());
        vacationRequest.setEndDate(vacation.getEndDate());
        vacationRequest.setDuration(
                countVacationDuration(vacation.getStartDate(), vacation.getEndDate())
        );
        vacationRequest.setDescription(vacation.getDescription());
        vacationRequest.setType(vacation.getType());
        vacationRequest.setStatus(VacationRequestStatus.PENDING);
        vacationRequest.setWithPay(vacation.isWithPay());

        User user = userRepository.findById(vacation.getUser().getId())
                .orElseThrow(() -> new EntityNotFoundException("User not found"));

        vacationRequest.setUser(user);

        repository.save(vacationRequest);
        logger.info("Vacation created successfully with ID: {}", vacationRequest.getId());

        return vacationMapper.toDTO(vacationRequest);
    }

    public VacationRequestDTO getVacation(Long vacationId) {
        VacationRequest vacation = repository.findById(vacationId).orElseThrow();
        logger.info("Vacation found with ID: {}", vacation.getId());
        return vacationMapper.toDTO(vacation);
    }

    public List<VacationRequestDTO> getAllVacations(Long userId, VacationRequestStatus status) {
        List<VacationRequest> results;

        if (userId != null) {
            if (status != null) {
                results = repository.findByUserIdAndStatus(userId, status);
            } else {
                results = repository.findByUserId(userId);
            }
        } else if (status != null) {
            results = repository.findByStatus(status);
        } else {
            results = repository.findAll();
        }

        logger.info("Getting all vacations");
        return Streamable.of(results).toList().stream().map(vacationMapper::toDTO).toList();
    }

    public VacationRequestDTO updateVacation(Long vacationId, VacationRequestStatus status) {
        return repository.findById(vacationId).map(vacation -> {
            vacation.setStatus(status);
            VacationRequest updated = repository.save(vacation); // save the updated entity
            logger.info("Vacation with ID: {} updated with status: {}", vacationId, status);
            return vacationMapper.toDTO(updated);
        }).orElseThrow(() -> new EntityNotFoundException("VacationRequest not found with ID: " + vacationId));
    }

    public boolean deleteVacationById(Long vacationId) {
        logger.info("Attempting to delete Vacation with ID: {}", vacationId);
        VacationRequest vacation = repository.findById(vacationId)
                .orElseThrow(() -> new EntityNotFoundException("Vacation not found with ID: " + vacationId));

        User current = jwtInterceptor.getCurrentUser();
        if (!hasRole(ROLE_ADMIN)) {
            //Verify that user is attempting to delete own VacationRequest and is of status PENDING
            if (!Objects.equals(current.getId(), vacation.getUser().getId())) {
                throw new VacationRequestException("Only own vacation requests can be deleted.");
            }
            if (vacation.getStatus() != VacationRequestStatus.PENDING) {
                throw new VacationRequestException("Only vacation requests with PENDING status can be deleted.");
            }
        }

        logger.info("Deleted Vacation with ID: {}", vacationId);
        repository.deleteById(vacationId);
        return true;
    }

    private Long countVacationDuration(LocalDate startDate, LocalDate endDate) {
        List<LocalDate> publicHolidays = publicHolidayProvider.getHolidaysBetweenDates(startDate, endDate, "RO");

        return startDate.datesUntil(endDate.plusDays(1))
                .filter(date -> !weekendProvider.isWeekend(date, "RO"))
                .filter(date -> !publicHolidays.contains(date))
                .count();
    }

    private boolean hasRole(String role) {
        return SecurityContextHolder.getContext().getAuthentication()
                .getAuthorities()
                .stream()
                .anyMatch(auth -> auth.getAuthority().equals(role));
    }
}
