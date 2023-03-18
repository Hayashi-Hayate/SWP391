
package model;

public class Room {
    private int roomNumber;
    private int houseID;
    private boolean status;
    private String roomInfo;
    private int rent_money;

    public Room() {
    }
    
    public int getRent_money() {
        return rent_money;
    }

    public void setRent_money(int rent_money) {
        this.rent_money = rent_money;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getHouseID() {
        return houseID;
    }

    public void setHouseID(int houseID) {
        this.houseID = houseID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getRoomInfo() {
        return roomInfo;
    }

    public void setRoomInfo(String roomInfo) {
        this.roomInfo = roomInfo;
    }

}
