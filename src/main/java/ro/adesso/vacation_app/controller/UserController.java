package ro.adesso.vacation_app.controller;

import jakarta.transaction.Transactional;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ro.adesso.vacation_app.dto.UserDTO;
import ro.adesso.vacation_app.model.User;
import ro.adesso.vacation_app.service.UserService;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {

    private final UserService service;

    public UserController(UserService service) {
        this.service = service;
    }

    @GetMapping("/me")
    public User getCurrentUser() {
        return null;
    }

    @Transactional
    @PostMapping()
    public ResponseEntity<UserDTO> addUser(@RequestBody UserDTO user) {
        return ResponseEntity.status(HttpStatus.CREATED).body(service.createUser(user));
    }

    @GetMapping("/{userId}")
    public ResponseEntity<UserDTO> getUser(@PathVariable("userId") Long userId) {
        UserDTO user = service.getUser(userId);

        return user.getId() != null
                ? ResponseEntity.ok(user)
                : ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
    }

    @GetMapping()
    public ResponseEntity<List<UserDTO>> getAllUsers() {
        List<UserDTO> users = service.getAllUsers();
        if (users.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(users);
    }

    @Transactional
    @PutMapping("/{userId}")
    public ResponseEntity<Void> archiveUser(@PathVariable("userId") Long userId) {
        service.archiveUser(userId);
        return ResponseEntity.noContent().build();
    }

}
