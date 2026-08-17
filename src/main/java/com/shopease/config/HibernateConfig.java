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
                System.getenv("DB_DRIVER")
        );

        ds.setUrl(
                System.getenv("DB_URL")
        );

        ds.setUsername(
                System.getenv("DB_USERNAME")
        );

        ds.setPassword(
                System.getenv("DB_PASSWORD")
        );

        return ds;
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory(
            DataSource ds) {

        LocalContainerEntityManagerFactoryBean factory =
                new LocalContainerEntityManagerFactoryBean();

        factory.setDataSource(ds);

        factory.setPackagesToScan("com.shopease.model");

        factory.setJpaVendorAdapter(
                new HibernateJpaVendorAdapter()
        );

        Properties properties = new Properties();

        properties.put(
                "hibernate.dialect",
                "org.hibernate.dialect.Oracle10gDialect"
        );

        properties.put(
                "hibernate.hbm2ddl.auto",
                "update"
        );

        properties.put(
                "hibernate.show_sql",
                "false"
        );

        properties.put(
                "hibernate.format_sql",
                "true"
        );

        factory.setJpaProperties(properties);

        return factory;
    }

    @Bean
    public JpaTransactionManager transactionManager(
            EntityManagerFactory emf) {

        return new JpaTransactionManager(emf);
    }
}