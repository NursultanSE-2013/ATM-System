package com.company.repositories;

import com.company.data.interfaces.IDBManager;
import com.company.entities.Fund;
import com.company.repositories.interfaces.IFundsRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FundsRepository implements IFundsRepository {
    private final IDBManager dbManager;

    public FundsRepository(IDBManager dbManager) {
        this.dbManager = dbManager;
    }

    @Override
    public ArrayList<Fund> showFunds() {
        try{
            Connection connection = null;
            connection = dbManager.getConnection();
            String sql = "SELECT * FROM funds";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<Fund> list = new ArrayList<Fund>();
            while(resultSet.next()){
                Fund fund = new Fund(resultSet.getInt("cardNumber"),
                        resultSet.getInt("ATMID"),
                        resultSet.getDouble("amount"));
                list.add(fund);
            }
            return list;

        } catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean addFund(Fund fund) {
        try{
            Connection connection = null;
            connection = dbManager.getConnection();
            String sql = "INSERT INTO funds(ATMID, cardNumber, amount) VALUES (?,?,?)";
            PreparedStatement stat = connection.prepareStatement(sql);
            stat.setInt(1, fund.getCardNumber());
            stat.setInt(2, fund.getATMID());
            stat.setDouble(3, fund.getamount());
            stat.executeUpdate();
            connection.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
