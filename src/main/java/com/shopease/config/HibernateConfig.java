package com.shopease.config;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class HibernateConfig {

    @Bean
    public DataSource dataSource() {

        DriverManagerDataSource ds = new DriverManagerDataSource();

        ds.setDriverClassName(
                getRequiredEnvironmentVariable("DB_DRIVER")
        );

        ds.setUrl(
                getRequiredEnvironmentVariable("DB_URL")
        );

        ds.setUsername(
                getRequiredEnvironmentVariable("DB_USERNAME")
        );

        ds.setPassword(
                getRequiredEnvironmentVariable("DB_PASSWORD")
        );

        return ds;
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory(
            DataSource ds) {

        LocalContainerEntityManagerFactoryBean factory =
                new LocalContainerEntityManagerFactoryBean();

        factory.setDataSource(ds);

        factory.setPackagesToScan(
                "com.shopease.model"
        );

        factory.setJpaVendorAdapter(
                new HibernateJpaVendorAdapter()
        );

        Properties properties = new Properties();

        // PostgreSQL / Supabase
        properties.put(
                "hibernate.dialect",
                "org.hibernate.dialect.PostgreSQLDialect"
        );

        // Create/update tables automatically
        properties.put(
                "hibernate.hbm2ddl.auto",
                "update"
        );

        // Don't print SQL in production logs
        properties.put(
                "hibernate.show_sql",
                "false"
        );

        // Format SQL if Hibernate logs it
        properties.put(
                "hibernate.format_sql",
                "true"
        );

        // Use UTC for JDBC time handling
        properties.put(
                "hibernate.jdbc.time_zone",
                "UTC"
        );

        factory.setJpaProperties(properties);

        return factory;
    }

    @Bean
    public JpaTransactionManager transactionManager(
            EntityManagerFactory emf) {

        return new JpaTransactionManager(emf);
    }

    private String getRequiredEnvironmentVariable(String name) {

        String value = System.getenv(name);

        if (value == null || value.trim().isEmpty()) {
            throw new IllegalStateException(
                    "Required environment variable is missing: " + name
            );
        }

        return value;
    }
}
