package ro.adesso.vacation_app.service;

import jakarta.persistence.EntityNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.util.Streamable;
import org.springframework.stereotype.Service;
import ro.adesso.vacation_app.dto.VacationRequestDTO;
import ro.adesso.vacation_app.dto.mapper.VacationMapper;
import ro.adesso.vacation_app.model.VacationRequest;
import ro.adesso.vacation_app.model.VacationRequestStatus;
import ro.adesso.vacation_app.repository.VacationRequestRepository;

import java.util.List;

@Service
public class VacationRequestService {

    private final VacationRequestRepository repository;
    private final VacationMapper vacationMapper;
    private static final Logger logger = LoggerFactory.getLogger(VacationRequestService.class);

    public VacationRequestService(VacationRequestRepository repository, VacationMapper vacationMapper) {
        this.repository = repository;
        this.vacationMapper = vacationMapper;
    }

    public VacationRequestDTO createVacation(VacationRequestDTO vacation) {
        VacationRequest vacationRequest = new VacationRequest();
        vacationRequest.setStartDate(vacation.getStartDate());
        vacationRequest.setEndDate(vacation.getEndDate());
        vacationRequest.setDuration(vacation.getDuration());
        vacationRequest.setDescription(vacation.getDescription());
        vacationRequest.setType(vacation.getType());
        vacationRequest.setStatus(VacationRequestStatus.PENDING);
        vacationRequest.setWithPay(vacation.isWithPay());
        vacationRequest.setUser(vacation.getUser());

        repository.save(vacationRequest);
        logger.info("Vacation created successfully with ID: {}", vacationRequest.getId());

        return vacationMapper.toDTO(vacationRequest);
    }

    public VacationRequestDTO getVacation(Long vacationId) {
        VacationRequest vacation = repository.findById(vacationId).orElseThrow();
        logger.info("Vacation found with ID: {}", vacation.getId());
        return vacationMapper.toDTO(vacation);
    }

    public List<VacationRequestDTO> getAllVacations() {
        logger.info("Getting all vacations");
        return Streamable.of(repository.findAll()).toList().stream().map(vacationMapper::toDTO).toList();
    }

    public void updateVacation(Long vacationId, VacationRequestStatus status) {
        logger.info("Vacation with ID: {} updated with status: {}", vacationId, status);
        repository.findById(vacationId).ifPresent(vacation -> vacation.setStatus(status));
    }

    public void deleteVacationById(Long vacationId) {
        logger.info("Attempting to delete Vacation with ID: {}", vacationId);
        VacationRequest vacation = repository.findById(vacationId)
                .orElseThrow(() -> new EntityNotFoundException("Vacation not found with ID: " + vacationId));

        if (vacation.getStatus() != VacationRequestStatus.PENDING) {
            throw new IllegalStateException("Only vacation requests with PENDING status can be deleted.");
        }

        repository.deleteById(vacationId);
        logger.info("Deleted Vacation with ID: {}", vacationId);
    }
}
