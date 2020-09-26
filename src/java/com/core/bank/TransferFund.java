package com.core.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

public class TransferFund 
{
    public static String MESSAGE;
    
    private int debitAccountNumber;
    private int creditAccountNumber;
    private String date;
    private double amount;
    

    public TransferFund() {
    }

    public TransferFund(int debitAccountNumber, int creditAccountNumber, String date, double amount, int accountNumber) {
        this.debitAccountNumber = debitAccountNumber;
        this.creditAccountNumber = creditAccountNumber;
        this.date = date;
        this.amount = amount;
        
    }

    public int getDebitAccountNumber() {
        return debitAccountNumber;
    }

    public void setDebitAccountNumber(int debitAccountNumber) {
        this.debitAccountNumber = debitAccountNumber;
    }

    public int getCreditAccountNumber() {
        return creditAccountNumber;
    }

    public void setCreditAccountNumber(int creditAccountNumber) {
        this.creditAccountNumber = creditAccountNumber;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    
    
    public boolean exists(Connection connection)
    {
        boolean flag=false;
        try
        {
            PreparedStatement ps=connection.prepareStatement("select * from account where accountnumber=?");
            ps.setInt(1, debitAccountNumber);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                ps=connection.prepareStatement("select * from account where accountnumber=?");
                ps.setInt(1, creditAccountNumber);
                rs=ps.executeQuery();
                if(rs.next())
                {
                    flag=true;
                }
                else
                {
                    throw new Exception("Credit Account Does Not Exists");
                }
            }
            else
            {
                throw new Exception("Debit Account Does Not Exists");
            }
        }
        catch(Exception e)
        {
            MESSAGE=e.getMessage();
        }
        return flag;
    }


    public void withdraw(Connection connection)
    {
        try
        {
            if(exists(connection))
            {
                PreparedStatement ps=connection.prepareStatement("select balance from account where accountnumber=?");
                ps.setInt(1, debitAccountNumber);
                ResultSet rs=ps.executeQuery();
                if(rs.next())
                {
                    double currentBalance=rs.getDouble(1);
                    if(amount<=currentBalance)
                    {
                        int tid=new Random().nextInt(100000000);
                        ps=connection.prepareStatement("insert into transfer values(?,?,?,?,?)");
                        ps.setInt(1, tid);
                        ps.setString(2, date);
                        ps.setDouble(3, amount);
                        ps.setInt(4, debitAccountNumber);
                        ps.setInt(5, creditAccountNumber);
                        int a=ps.executeUpdate();
                        if(a==1)
                        {
                            ps=connection.prepareStatement("update account set balance=balance-? where accountnumber=?");
                            ps.setDouble(1, amount);
                            ps.setInt(2, debitAccountNumber);
                            a+=ps.executeUpdate();
                            if(a==2)
                            {
                                ps=connection.prepareStatement("update account set balance=balance+? where accountnumber=?");
                                ps.setDouble(1, amount);
                                ps.setInt(2, creditAccountNumber);
                                a+=ps.executeUpdate();                                
                                if(a==3)
                                {
                                    connection.commit();
                                    MESSAGE="Transfer Transaction Successfull...TID : "+tid;
                                }
                                else
                                {
                                    connection.rollback();
                                    MESSAGE="Transfer Transaction Declined...Cannot Update Balance";
                                }
                            }
                            else
                            {
                                connection.rollback();
                                MESSAGE="Transfer Transaction Declined...Cannot Update Balance";
                            }
                        }
                        else
                        {
                            connection.rollback();
                            MESSAGE="Transfer Transaction Declined";
                        }                        
                    }
                    else
                    {
                        MESSAGE="Insufficient Balance...Transaction Declined";
                    }
                }
            }
            else
            {
                MESSAGE+="...RETRY";
            }
        }
        catch(Exception e)
        {
            MESSAGE=e.getMessage();
        }
    }
    
}
