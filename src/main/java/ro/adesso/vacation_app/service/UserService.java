package ro.adesso.vacation_app.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.util.Streamable;
import org.springframework.stereotype.Service;
import ro.adesso.vacation_app.dto.UserDTO;
import ro.adesso.vacation_app.dto.mapper.UserMapper;
import ro.adesso.vacation_app.model.User;
import ro.adesso.vacation_app.repository.UserRepository;

import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

@Service
public class UserService {

    @Value("${user.default-alloted-vacation-days}")
    private int defaultAllotedVacationDays;
    private final UserRepository repository;
    private final UserMapper userMapper;
    private static final Logger logger = LoggerFactory.getLogger(UserService.class);

    public UserService(UserRepository repository, UserMapper userMapper) {
        this.repository = repository;
        this.userMapper = userMapper;
    }

    public UserDTO createUser(UserDTO user) {
        User newUser = new User();
        newUser.setUsername(user.getUsername());
        newUser.setEmail(user.getEmail());
        newUser.setFirstName(user.getFirstName());
        newUser.setLastName(user.getLastName());
        newUser.setAllotedVacationDays(defaultAllotedVacationDays);

        // Save report to user
        if (user.getReportsTo() != null) {
            User reportsTo = repository.findById(user.getReportsTo().getId()).orElse(null);
            newUser.setReportsTo(reportsTo);
        }
        newUser.setArchived(false);

        repository.save(newUser);
        logger.info("User created successfully with ID: {}", newUser.getId());

        return userMapper.toDTO(newUser);
    }

    public boolean archiveUser(Long userId) {
        AtomicBoolean archived = new AtomicBoolean(false);

        repository.findById(userId).ifPresentOrElse(user -> {
            user.setArchived(true);
            repository.save(user);
            logger.info("Archived user with ID: {}", userId);
            archived.set(true);
        }, () -> {
            logger.warn("User with ID {} not found for archiving", userId);
        });

        return archived.get();
    }

    public UserDTO getUser(Long userId) {
        User user = repository.findById(userId).orElseThrow();
        logger.info("User found with ID: {}", user.getId());
        return userMapper.toDTO(user);
    }

    public List<UserDTO> getAllUsers() {
        logger.info("Getting all users");
        return Streamable.of(repository.findAll()).toList().stream().map(userMapper::toDTO).toList();
    }

}
