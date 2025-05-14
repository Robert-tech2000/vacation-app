package ro.adesso.vacation_app;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import ro.adesso.vacation_app.controller.VacationRequestController;
import ro.adesso.vacation_app.dto.UserDTO;
import ro.adesso.vacation_app.dto.VacationRequestDTO;
import ro.adesso.vacation_app.dto.mapper.UserMapper;
import ro.adesso.vacation_app.dto.mapper.VacationMapper;
import ro.adesso.vacation_app.model.User;
import ro.adesso.vacation_app.model.VacationRequest;
import ro.adesso.vacation_app.model.VacationRequestStatus;
import ro.adesso.vacation_app.model.VacationRequestType;
import ro.adesso.vacation_app.repository.VacationRequestRepository;
import ro.adesso.vacation_app.service.NagerPublicHolidayService;
import ro.adesso.vacation_app.service.VacationRequestService;
import ro.adesso.vacation_app.util.PublicHolidayProvider;
import ro.adesso.vacation_app.util.WeekendProvider;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class VacationAppVacationRequestsUnitTest {

    @InjectMocks
    private VacationRequestController controller;

    @InjectMocks
    private VacationRequestService vacationService;

    @Mock
    private VacationRequestService service;

    @Mock
    private PublicHolidayProvider publicHolidayProvider;

    @Mock
    private NagerPublicHolidayService nagerPublicHolidayService;

    @Mock
    private WeekendProvider weekendProvider;

    @Mock
    private VacationRequestRepository repository;

    @Mock
    private VacationMapper vacationMapper;

    @Mock
    private UserMapper userMapper;

    @BeforeEach
    void setUp() {
        UserDTO vacationRequester = new UserDTO();
        vacationRequester.setUsername("test_user");
        vacationRequester.setEmail("test@user.com");
        vacationRequester.setFirstName("Test");
        vacationRequester.setLastName("User");
    }

    @Test
    void testCreateVacationRequest() {
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


        VacationRequestDTO intputRequestDTO = new VacationRequestDTO();
        intputRequestDTO.setId(1L);
        intputRequestDTO.setStartDate(LocalDate.parse("2025-01-01"));
        intputRequestDTO.setEndDate(LocalDate.parse("2025-01-10"));
        intputRequestDTO.setType(VacationRequestType.HOLIDAY);
        intputRequestDTO.setWithPay(true);
        intputRequestDTO.setStatus(VacationRequestStatus.PENDING);
        intputRequestDTO.setDescription("Vacation Request");

        VacationRequest mappedVacationRequest = new VacationRequest();
        mappedVacationRequest.setId(1L);
        mappedVacationRequest.setStartDate(LocalDate.parse("2025-01-01"));
        mappedVacationRequest.setEndDate(LocalDate.parse("2025-01-10"));
        mappedVacationRequest.setType(VacationRequestType.HOLIDAY);
        mappedVacationRequest.setWithPay(true);
        mappedVacationRequest.setStatus(VacationRequestStatus.PENDING);
        mappedVacationRequest.setDescription("Vacation Request");

        VacationRequest savedVacationRequest = new VacationRequest();
        savedVacationRequest.setId(1L);
        savedVacationRequest.setStartDate(LocalDate.parse("2025-01-01"));
        savedVacationRequest.setEndDate(LocalDate.parse("2025-01-10"));
        savedVacationRequest.setType(VacationRequestType.HOLIDAY);
        savedVacationRequest.setWithPay(true);
        savedVacationRequest.setStatus(VacationRequestStatus.PENDING);
        savedVacationRequest.setDescription("Vacation Request");

        VacationRequestDTO outputRequestDTO = new VacationRequestDTO();
        outputRequestDTO.setId(1L);
        outputRequestDTO.setStartDate(LocalDate.parse("2025-01-01"));
        outputRequestDTO.setEndDate(LocalDate.parse("2025-01-10"));
        outputRequestDTO.setType(VacationRequestType.HOLIDAY);
        outputRequestDTO.setWithPay(true);
        outputRequestDTO.setStatus(VacationRequestStatus.PENDING);
        outputRequestDTO.setDescription("Vacation Request");

        when(repository.save(any(VacationRequest.class))).thenReturn(savedVacationRequest);
        when(vacationMapper.toDTO(any(VacationRequest.class))).thenReturn(outputRequestDTO);
        when(userMapper.toEntity(any())).thenReturn(mappedUser);

        List<LocalDate> holidays = List.of(
                LocalDate.of(2025, 1, 1),
                LocalDate.of(2025, 1, 2),
                LocalDate.of(2025, 1, 6),
                LocalDate.of(2025, 1, 7)
        );
        when(
                publicHolidayProvider.getHolidaysBetweenDates(
                        intputRequestDTO.getStartDate(),
                        intputRequestDTO.getEndDate(), "RO")
        )
                .thenReturn(holidays);

        when(weekendProvider.isWeekend(any(LocalDate.class), eq("RO")))
                .thenAnswer(invocation -> {
                    LocalDate date = invocation.getArgument(0);
                    return date.getDayOfWeek() == DayOfWeek.SATURDAY || date.getDayOfWeek() == DayOfWeek.SUNDAY;
                });


        // When
        VacationRequestDTO createdVacationRequest = vacationService.createVacation(intputRequestDTO);

        // Then
        assertNotNull(createdVacationRequest);
        assertEquals(1L, createdVacationRequest.getId());
        assertTrue(createdVacationRequest.isWithPay());
    }

    @Test
    void getVacation_shouldReturn200WhenFound() {
        // Arrange
        VacationRequestDTO vacationRequest = new VacationRequestDTO();
        vacationRequest.setId(1L);
        vacationRequest.setDescription("Vacation");

        when(service.getVacation(1L)).thenReturn(vacationRequest);

        // Act
        ResponseEntity<VacationRequestDTO> response = controller.getVacation(1L);

        // Assert
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertNotNull(response.getBody());
        assertEquals(1L, response.getBody().getId());
        assertEquals("Vacation", response.getBody().getDescription());
    }
}
