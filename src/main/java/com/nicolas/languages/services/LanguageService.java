package com.nicolas.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.nicolas.languages.model.Language;
import com.nicolas.languages.repository.LanguageRepository;

@Service
public class LanguageService {
    private final LanguageRepository languageRepository;
    
    public LanguageService(LanguageRepository languageRepository) {
        this.languageRepository = languageRepository;
    }

    public List<Language> allLanguages() {
        return languageRepository.findAll();
    }

    public Language create(Language language){
        return languageRepository.save(language);
    }

    public Optional<Language> findById(Long id){
        
        return languageRepository.findById(id);
    }

    public void editLanguage(Long id, Language language){
        Optional<Language> findedLanguage = languageRepository.findById(id);
        if(findedLanguage.isPresent()){
            language.setId(findedLanguage.get().getId());
            languageRepository.save(language);
        }
    }

    public void deleteLanguage(Long id){
        languageRepository.deleteById(id);
    }

}
