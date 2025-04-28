package ro.adesso.vacation_app.dto;

import lombok.Getter;
import lombok.Setter;
import ro.adesso.vacation_app.model.VacationRequest;
import ro.adesso.vacation_app.util.AbstractEntity;

import java.util.List;

@Getter
@Setter
public class UserDTO extends AbstractEntity {

    private String username;
    private String firstName;
    private String lastName;
    private String email;
    private boolean isArchived;

    private List<VacationRequest> vacationRequests;
}
