package ro.adesso.vacation_app.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import lombok.*;
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
    @JsonIgnore
    private List<VacationRequest> vacationRequests;
}
