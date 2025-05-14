package ro.adesso.vacation_app;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import ro.adesso.vacation_app.dto.UserDTO;
import ro.adesso.vacation_app.dto.mapper.UserMapper;
import ro.adesso.vacation_app.model.User;
import ro.adesso.vacation_app.repository.UserRepository;
import ro.adesso.vacation_app.service.UserService;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class VacationAppUserUnitTest {

    @InjectMocks
    private UserService userService;

    @Mock
    private UserRepository repository;

    @Mock
    private UserMapper userMapper;

    @Test
    void testCreateUser() {
        // Given
        UserDTO inputUser = new UserDTO();
        inputUser.setUsername("test_user");
        inputUser.setEmail("test@user.com");
        inputUser.setFirstName("Test");
        inputUser.setLastName("User");

        User mappedUser = new User();
        mappedUser.setUsername("test_user");
        mappedUser.setEmail("test@user.com");
        mappedUser.setFirstName("Test");
        mappedUser.setLastName("User");

        User savedUser = new User();
        savedUser.setId(1L);
        savedUser.setUsername("test_user");
        savedUser.setEmail("test@user.com");
        savedUser.setFirstName("Test");
        savedUser.setLastName("User");

        UserDTO outputDto = new UserDTO();
        outputDto.setId(1L);
        outputDto.setUsername("test_user");
        outputDto.setEmail("test@user.com");
        outputDto.setFirstName("Test");
        outputDto.setLastName("User");

        when(userMapper.toEntity(any())).thenReturn(mappedUser);
        when(repository.save(any(User.class))).thenReturn(savedUser);
        when(userMapper.toDTO(any(User.class))).thenReturn(outputDto);

        // When
        UserDTO createdUser = userService.createUser(inputUser);

        // Then
        assertNotNull(createdUser);
        assertEquals(1L, createdUser.getId());
        assertEquals("test_user", createdUser.getUsername());
        assertEquals("Test", createdUser.getFirstName());
        assertEquals("User", createdUser.getLastName());
        assertEquals("test@user.com", createdUser.getEmail());
        verify(repository).save(any(User.class));
    }

    @Test
    void testFindExistingUser() {
        // Given
        User user = new User();
        user.setId(1L);
        user.setUsername("test_user");

        UserDTO dto = new UserDTO();
        dto.setId(1L);
        dto.setUsername("test_user");

        when(repository.findById(1L)).thenReturn(Optional.of(user));
        when(userMapper.toDTO(user)).thenReturn(dto);

        // When
        UserDTO result = userService.getUser(1L);

        // Then
        assertNotNull(result);
        assertEquals("test_user", result.getUsername());
    }

    @Test
    void testGetAllUsers_shouldReturnList() {
        // Given
        User user = new User();
        user.setUsername("test_user");

        UserDTO dto = new UserDTO();
        dto.setUsername("test_user");

        when(repository.findAll()).thenReturn(List.of(user));
        when(userMapper.toDTO(user)).thenReturn(dto);

        // When
        List<UserDTO> result = userService.getAllUsers();

        // Then
        assertEquals(1, result.size());
        assertEquals("test_user", result.get(0).getUsername());
    }

    @Test
    void testArchiveUser_shouldSetArchivedTrue() {
        // Given
        User user = new User();
        user.setId(1L);
        user.setArchived(false);

        when(repository.findById(1L)).thenReturn(Optional.of(user));

        // When
        userService.archiveUser(1L);

        // Then
        assertTrue(user.isArchived());
        verify(repository).findById(1L);
    }

}
