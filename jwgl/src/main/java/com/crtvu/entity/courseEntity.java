package com.crtvu.entity;

/**
 * Created by yangming on 2017/3/16/0016.
 */
public class courseEntity {
    private String id;
    private String name;
    private Float credit;
    private String nature;
    private String department;

    public courseEntity() {
    }

    public courseEntity(String id, String name, Float credit, String nature, String department) {
        this.id = id;
        this.name = name;
        this.credit=credit;
        this.nature = nature;
        this.department = department;
    }

    public courseEntity(String id, String name, String nature, String department) {
        this.id = id;
        this.name = name;
        this.nature = nature;
        this.department = department;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getCredit() {
        return credit;
    }

    public void setCredit(Float credit) {
        this.credit = credit;
    }

    public String getNature() {
        return nature;
    }

    public void setNature(String nature) {
        this.nature = nature;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @Override
    public String toString() {
        return "courseEntity{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", credit=" + credit +
                ", nature='" + nature + '\'' +
                ", department='" + department + '\'' +
                '}';
    }
}
