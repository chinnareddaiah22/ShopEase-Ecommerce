package com.shopease.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.shopease.service.CustomUserDetailsService;

@Configuration
@EnableWebSecurity
@ComponentScan("com.shopease")
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(12);
    }

    @Bean
    public SecurityFilterChain securityFilterChain(
            HttpSecurity http,
            CustomUserDetailsService userDetailsService) throws Exception {

        http.userDetailsService(userDetailsService);

        http.authorizeRequests()
            .antMatchers(
                "/",
                "/login",
                "/register",
                "/css/**",
                "/js/**",
                "/images/**"
            ).permitAll()
            .antMatchers("/admin/**").hasRole("ADMIN")
            .antMatchers("/cart/**", "/checkout", "/checkout-page", "/orders/**").authenticated()
            .anyRequest().permitAll()

            .and()
            .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/perform_login")
                .usernameParameter("username")
                .passwordParameter("password")
                .defaultSuccessUrl("/", false)
                .failureUrl("/login?error")
                .permitAll()

            .and()
            .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login?logout")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .permitAll()

            .and()
            .csrf();

        return http.build();
    }
}