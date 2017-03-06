package com.crtvu.entity;

/**
 * Created by Phoenix on 2017/3/6.
 */
public class sampleEntity {

    private String name;

    public sampleEntity() {
    }

    public sampleEntity(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "sampleEntity{" +
                "name='" + name + '\'' +
                '}';
    }
}
