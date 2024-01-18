package com.nicolas.languages.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "languages")
public class Language extends ModelBase{
    @Size(min = 2, max = 20)
    private String name;

    @Size(min = 2, max = 20)
    private String creator;

    @NotEmpty
    private String currentVersion;

    public Language() {
    }

    public Language(@Size(min = 2, max = 20) String name, @Size(min = 2, max = 20) String creator,
            @NotEmpty String currentVersion) {
        this.name = name;
        this.creator = creator;
        this.currentVersion = currentVersion;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public String getCurrentVersion() {
        return currentVersion;
    }

    public void setCurrentVersion(String currentVersion) {
        this.currentVersion = currentVersion;
    }

    
}
