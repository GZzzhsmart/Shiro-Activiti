package com.th.bean;


import java.util.Date;

public class LeaveApply {

    private Integer days;
    private String reason;
    private Date datetime;

    public LeaveApply() {

    }

    public LeaveApply(Integer days, String reason, Date datetime) {
        this.days = days;
        this.reason = reason;
        this.datetime = datetime;
    }

    public Integer getDays() {
        return days;
    }

    public void setDays(Integer days) {
        this.days = days;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }
}
