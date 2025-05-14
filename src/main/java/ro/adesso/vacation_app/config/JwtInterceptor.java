package ro.adesso.vacation_app.config;

import com.nimbusds.jose.shaded.gson.internal.LinkedTreeMap;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import ro.adesso.vacation_app.model.User;
import ro.adesso.vacation_app.repository.UserRepository;

import java.io.IOException;
import java.util.ArrayList;

@Slf4j
@Getter
@Component
public class JwtInterceptor implements HandlerInterceptor {


    @Value("${security.roles.admin}")
    public String ADMIN_ROLE;

    @Value("${security.roles.employee}")
    public String EMPLOYEE_ROLE;

    @Value("${user.default-alloted-vacation-days}")
    private int defaultAllotedVacationDays;

    private final UserRepository userRepository;

    private final HttpServletRequest request;

    private User currentUser;

    @Autowired
    public JwtInterceptor(UserRepository userRepository, HttpServletRequest request) {
        this.userRepository = userRepository;
        this.request = request;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {

        var authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication == null || !(authentication.getPrincipal() instanceof Jwt jwt)) {
            log.warn("No JWT found in security context.");
            return true;
        }

        return !getUserFromToken(jwt);
    }

    public User getCurrentUser() {
        return userRepository.findByUsername(currentUser.getUsername()).orElseGet(() -> {
            log.warn("User not found in database, returning null.");
            return null;
        });
    }

    private boolean getUserFromToken(Jwt jwt) {
        String username = jwt.getClaimAsString("preferred_username");
        if (username == null) {
            log.warn("No username found in JWT.");
            return true;
        }

        this.currentUser = userRepository.findByUsername(username).orElseGet(() -> {
            User newAccount = User.builder()
                    .username(username)
                    .firstName(jwt.getClaimAsString("given_name"))
                    .lastName(jwt.getClaimAsString("family_name"))
                    .allotedVacationDays(defaultAllotedVacationDays)
                    .email(jwt.getClaimAsString("email"))
                    .build();

            ArrayList<String> jwtRoles = (ArrayList<String>) ((LinkedTreeMap<?, ?>) jwt.getClaim("realm_access")).get("roles");
            boolean isAdmin = jwtRoles.contains(ADMIN_ROLE);
            boolean isEmployee = jwtRoles.contains(EMPLOYEE_ROLE);

//            if (isAdmin) {
//                newAccount.setRoles(List.of(Role.ADMIN_ROLE));
//            } else if (isEmployee) {
//                newAccount.setRoles(List.of(Role.EMPLOYEE_ROLE));
//            }
            newAccount = userRepository.save(newAccount);
            return newAccount;
        });

        return false;
    }

}
