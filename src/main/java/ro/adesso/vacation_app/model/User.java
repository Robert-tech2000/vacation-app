package ro.adesso.vacation_app.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import ro.adesso.vacation_app.util.AbstractEntity;

import java.util.List;

@Entity
@Getter
@Setter
public class User extends AbstractEntity {

    @Column(unique = true, nullable = false)
    private String username;
    private String firstName;
    private String lastName;
    private String email;
    private int allotedVacationDays;
    private boolean isArchived;

    @OneToOne
    private User reportsTo;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    @JsonIgnore
    private List<VacationRequest> vacationRequests;

}
