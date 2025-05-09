package ro.adesso.vacation_app.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import ro.adesso.vacation_app.util.AbstractEntity;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO extends AbstractEntity {

    private Long id;

    private String username;
    private String firstName;
    private String lastName;
    private String email;
    private int allotedVacationDays;
    private boolean isArchived;

    private UserDTO reportsTo;

    private List<VacationRequestDTO> vacationRequests;
}
