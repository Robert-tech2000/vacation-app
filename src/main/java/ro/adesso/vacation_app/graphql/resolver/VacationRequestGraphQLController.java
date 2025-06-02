package ro.adesso.vacation_app.graphql.resolver;

import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;
import ro.adesso.vacation_app.dto.VacationRequestDTO;
import ro.adesso.vacation_app.dto.mapper.UserMapper;
import ro.adesso.vacation_app.graphql.input.VacationRequestInput;
import ro.adesso.vacation_app.model.User;
import ro.adesso.vacation_app.model.VacationRequestStatus;
import ro.adesso.vacation_app.repository.UserRepository;
import ro.adesso.vacation_app.service.VacationRequestService;

import java.util.List;

@Controller
public class VacationRequestGraphQLController {

    private final VacationRequestService vacationService;
    private final UserRepository userRepository;
    private final UserMapper userMapper;

    public VacationRequestGraphQLController(VacationRequestService vacationService, UserRepository userRepository, UserMapper userMapper) {
        this.vacationService = vacationService;
        this.userRepository = userRepository;
        this.userMapper = userMapper;
    }

    @QueryMapping
    public VacationRequestDTO getVacation(@Argument Long id) {
        return vacationService.getVacation(id);
    }

    @QueryMapping
    public List<VacationRequestDTO> getAllVacations(@Argument("userId") Long userId, @Argument VacationRequestStatus status) {
        return vacationService.getAllVacations(userId, status);
    }

    @MutationMapping
    public VacationRequestDTO createVacationRequest(@Argument VacationRequestInput input) {
        User user = userRepository.findById(input.getUserId())
                .orElseThrow(() -> new RuntimeException("User not found"));

        VacationRequestDTO vacationRequestDTO = new VacationRequestDTO();

        vacationRequestDTO.setStartDate(input.getStartDate());
        vacationRequestDTO.setEndDate(input.getEndDate());
        vacationRequestDTO.setDescription(input.getDescription());
        vacationRequestDTO.setType(input.getType());
        vacationRequestDTO.setStatus(input.getStatus());
        vacationRequestDTO.setWithPay(input.isWithPay());
        vacationRequestDTO.setUser(userMapper.toDTO(user));

        return vacationService.createVacation(vacationRequestDTO);
    }

    @MutationMapping
    public VacationRequestDTO updateVacationStatus(@Argument Long vacationId,
                                        @Argument VacationRequestStatus status) {
        return vacationService.updateVacation(vacationId, status);
    }

    @MutationMapping
    public Boolean deleteVacation(@Argument Long vacationId) {
        return vacationService.deleteVacationById(vacationId);
    }

}