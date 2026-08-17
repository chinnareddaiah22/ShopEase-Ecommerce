package com.shopease.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
import com.shopease.service.ProductService;

/** Starts Spring MVC without web.xml. Compatible with Tomcat 9 / Servlet 4. */
public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
    @Override protected Class<?>[] getRootConfigClasses() {
        return new Class<?>[]{HibernateConfig.class, SecurityConfig.class, SeedConfig.class};
    }
    @Override protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[]{WebMvcConfig.class};
    }
    @Override protected String[] getServletMappings() { return new String[]{"/"}; }
}

@Configuration
class SeedConfig {
    @Bean
    public org.springframework.beans.factory.InitializingBean seedProducts(ProductService products) {
        return () -> products.seedIfEmpty();
    }
}
