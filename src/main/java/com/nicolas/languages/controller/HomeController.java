package com.nicolas.languages.controller;

import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nicolas.languages.model.Language;
import com.nicolas.languages.services.LanguageService;

import jakarta.validation.Valid;

@Controller
public class HomeController {
    private final LanguageService languageService;

    public HomeController(LanguageService languageService) {
        this.languageService = languageService;
    }

    @RequestMapping(value = "/languages", method = RequestMethod.GET)
    public String index(Model model, Language language) {
        model.addAttribute("languages", languageService.allLanguages());
        return "index";
    }

    @RequestMapping(value = "/languages", method = RequestMethod.POST)
    public String create(@Valid @ModelAttribute("language") Language language, BindingResult result) {
        if (result.hasErrors()) {
            return "index";
        } else {
            languageService.create(language);
            return "redirect:/languages";
        }
    }

    @RequestMapping(value = "/languages/{id}", method = RequestMethod.GET)
    public String findById(@PathVariable("id") Long id, Model model) {
        Optional<Language> languageFinded = languageService.findById(id);

        if (languageFinded.isPresent()) {
            model.addAttribute("language", languageFinded.get());
            return "language";
        } else {
            return "redirect:/languages";
        }
    }

    @RequestMapping(value = "/languages/edit/{id}", method = RequestMethod.GET)
    public String getPutLanguage(@PathVariable("id") Long id, Model model) {
        Optional<Language> languageFinded = languageService.findById(id);

        if (languageFinded.isPresent()) {
            model.addAttribute("language", languageFinded.get());
            return "editLanguage";
        } else {
            return "redirect:/languages";
        }

    }

    @RequestMapping(value = "/languages/edit/{id}", method = RequestMethod.PUT)
    public String putLanguage(@PathVariable("id") Long id, @Valid @ModelAttribute("language") Language language,
            BindingResult result) {
        if (result.hasErrors()) {
            return "editLanguage";
        } else {
            languageService.editLanguage(id, language);
            return "redirect:/languages";
        }
    }

    @RequestMapping(value = "/languages/delete/{id}", method = RequestMethod.DELETE)
    public String deleteLanguage(@PathVariable("id") Long id) {
        languageService.deleteLanguage(id);
        return "redirect:/languages";
    }

}
