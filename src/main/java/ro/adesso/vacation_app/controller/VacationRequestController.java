package ro.adesso.vacation_app.controller;

import jakarta.transaction.Transactional;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ro.adesso.vacation_app.dto.VacationRequestDTO;
import ro.adesso.vacation_app.model.VacationRequestStatus;
import ro.adesso.vacation_app.service.VacationRequestService;

import java.util.List;

@RestController
@RequestMapping("/vacations")
public class VacationRequestController {

    private final VacationRequestService service;

    public VacationRequestController(VacationRequestService service) {
        this.service = service;
    }

    @Transactional
    @PostMapping()
    public ResponseEntity<VacationRequestDTO> addVacation(@RequestBody VacationRequestDTO vacation) {
        return ResponseEntity.status(HttpStatus.CREATED).body(service.createVacation(vacation));
    }

    @GetMapping("/{vacationId}")
    public ResponseEntity<VacationRequestDTO> getVacation(@PathVariable("vacationId") Long vacationId) {
        VacationRequestDTO vacation = service.getVacation(vacationId);

        return vacation.getId() != null
                ? ResponseEntity.ok(vacation)
                : ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
    }

    @GetMapping()
    public ResponseEntity<List<VacationRequestDTO>> getAllVacations() {
        List<VacationRequestDTO> vacations = service.getAllVacations();
        if (vacations.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(vacations);
    }

    @Transactional
    @PutMapping("/{vacationId}")
    public ResponseEntity<Void> updateVacation(@PathVariable("vacationId") Long vacationId, VacationRequestStatus status) {
        service.updateVacation(vacationId, status);
        return ResponseEntity.noContent().build();
    }

    @Transactional
    @DeleteMapping("/{vacationId}")
    public ResponseEntity<Void> deleteClient(@PathVariable("vacationId") Long vacationId) {
        service.deleteVacationById(vacationId);
        return ResponseEntity.noContent().build();
    }

}
