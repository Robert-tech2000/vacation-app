package ro.adesso.vacation_app.service;

import org.springframework.data.util.Streamable;
import org.springframework.stereotype.Service;
import ro.adesso.vacation_app.dto.UserDTO;
import ro.adesso.vacation_app.model.User;
import ro.adesso.vacation_app.repository.UserRepository;

import java.util.List;

@Service
public class UserService {

    private final UserRepository repository;

    public UserService(UserRepository repository) {
        this.repository = repository;
    }

    public UserDTO createUser(UserDTO user) {
        User newUser = new User();
        newUser.setUsername(user.getUsername());
        newUser.setEmail(user.getEmail());
        newUser.setFirstName(user.getFirstName());
        newUser.setLastName(user.getLastName());
        newUser.setArchived(false);
        repository.save(newUser);

        return convertUserToDTO(newUser);
    }

    public void archiveUser(Long userId) {
        repository.findById(userId).ifPresent(user -> user.setArchived(true));
    }

    public UserDTO getUser(Long userId) {
        User client = repository.findById(userId).orElseThrow();
        return convertUserToDTO(client);
    }

    public List<UserDTO> getAllUsers() {
        return Streamable.of(repository.findAll()).toList().stream().map(this::convertUserToDTO).toList();
    }

    private UserDTO convertUserToDTO(User newUser) {
        UserDTO userDTO = new UserDTO();
        userDTO.setId(newUser.getId());
        userDTO.setUsername(newUser.getUsername());
        userDTO.setEmail(newUser.getEmail());
        userDTO.setFirstName(newUser.getFirstName());
        userDTO.setLastName(newUser.getLastName());
        userDTO.setArchived(newUser.isArchived());

        return userDTO;
    }

}
