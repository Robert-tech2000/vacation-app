package ro.adesso.vacation_app.service;

import org.springframework.data.util.Streamable;
import org.springframework.stereotype.Service;
import ro.adesso.vacation_app.dto.VacationRequestDTO;
import ro.adesso.vacation_app.model.VacationRequest;
import ro.adesso.vacation_app.model.VacationRequestStatus;
import ro.adesso.vacation_app.repository.VacationRequestRepository;

import java.util.List;

@Service
public class VacationRequestService {

    private final VacationRequestRepository repository;

    public VacationRequestService(VacationRequestRepository repository) {
        this.repository = repository;
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

        return convertVacationToDTO(vacationRequest);
    }

    public VacationRequestDTO getVacation(Long vacationId) {
        VacationRequest vacation = repository.findById(vacationId).orElseThrow();
        return convertVacationToDTO(vacation);
    }

    public List<VacationRequestDTO> getAllVacations() {
        return Streamable.of(repository.findAll()).toList().stream().map(this::convertVacationToDTO).toList();
    }

    public void updateVacation(Long vacationId, VacationRequestStatus status) {
        repository.findById(vacationId).ifPresent(vacation -> vacation.setStatus(status));
    }

    private VacationRequestDTO convertVacationToDTO(VacationRequest vacation) {
        VacationRequestDTO vacationDTO = new VacationRequestDTO();
        vacationDTO.setId(vacation.getId());
        vacationDTO.setStartDate(vacation.getStartDate());
        vacationDTO.setEndDate(vacation.getEndDate());
        vacationDTO.setDuration(vacation.getDuration());
        vacationDTO.setDescription(vacation.getDescription());
        vacationDTO.setStatus(vacation.getStatus());
        vacationDTO.setType(vacation.getType());
        vacationDTO.setWithPay(vacation.isWithPay());
        vacationDTO.setUser(vacation.getUser());

        return vacationDTO;
    }
}
