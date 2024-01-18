package com.nicolas.languages.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nicolas.languages.model.Language;

@Repository
public interface LanguageRepository extends CrudRepository<Language, Long>{
    List<Language> findAll();
}
