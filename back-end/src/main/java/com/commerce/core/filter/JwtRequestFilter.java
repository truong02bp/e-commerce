package com.commerce.core.filter;

import com.commerce.common.constants.SecurityConstants;
import com.commerce.common.utils.JwtUtils;
import com.commerce.data.dto.MyUserDetails;
import com.commerce.service.UserService;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class JwtRequestFilter extends OncePerRequestFilter {

    private final UserService userService;

    public JwtRequestFilter(UserService userService) {
        this.userService = userService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String header = request.getHeader(SecurityConstants.JWT_HEADER_STRING);
        if (header == null || !header.startsWith(SecurityConstants.JWT_TOKEN_PREFIX)) {
            filterChain.doFilter(request, response);
            return;
        }
        String jwt = header.substring(SecurityConstants.JWT_TOKEN_PREFIX.length());
        String username = JwtUtils.extractUsername(jwt);
        MyUserDetails userDetails = (MyUserDetails) userService.loadUserByUsername(username);
        if (JwtUtils.validateToken(jwt, userDetails)) {
            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
            authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
            SecurityContextHolder.getContext().setAuthentication(authenticationToken);
        }
        filterChain.doFilter(request, response);
    }
}
