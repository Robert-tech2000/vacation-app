package ro.adesso.vacation_app.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
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
    private boolean isArchived;

    @OneToMany
    private List<VacationRequest> vacationRequests;

}
