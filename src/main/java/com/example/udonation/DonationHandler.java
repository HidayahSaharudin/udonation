package com.example.udonation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SpeakerServlet
 */
@WebServlet("/DonationHandler")
public class DonationHandler extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DonationDao dd;
    public void init() {
        dd = new DonationDao();
    }

    public DonationHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/html");

        String action = request.getParameter("action");
        try {
            switch (action) {
                case "createDonation":
                    createDonation(request, response);
                    break;
                case "deleteDonation":
                    deleteDonation(request,response);
                    break;
                case "updateDonation":
                    updateDonation(request,response);
                    break;
                /*case "cancel":
                    cancel(request, response);
                    break;*/
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }

    }
    private void createDonation(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String donationName = request.getParameter("donationName");
        String donationDescription = request.getParameter("donationDescription");
        String donationOpenDate = request.getParameter("donationOpenDate");
        String donationCloseDate = request.getParameter("donationCloseDate");

        Donation don = new Donation();

        don.setDonationName(donationName);
        don.setDonationDescription(donationDescription);
        don.setDonationOpenDate(Date.valueOf(donationOpenDate));
        don.setDonationCloseDate(Date.valueOf(donationCloseDate));

        dd.createDonation(don);
        response.sendRedirect("donationList.jsp");
    }

    private void deleteDonation(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("donationID"));
        dd.deleteDonation(id);
        response.sendRedirect("donationList.jsp");
    }

    private void updateDonation(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("donationID"));
        String donationName = request.getParameter("donationName");
        String donationDescription = request.getParameter("donationDescription");
        String donationOpenDate = request.getParameter("donationOpenDate");
        String donationCloseDate = request.getParameter("donationCloseDate");

        Donation don = new Donation();

        don.setDonationID(id);
        don.setDonationName(donationName);
        don.setDonationDescription(donationDescription);
        don.setDonationOpenDate(Date.valueOf(donationOpenDate));
        don.setDonationCloseDate(Date.valueOf(donationCloseDate));

        dd.updateDonation(don);

        response.sendRedirect("donationList.jsp");
    }

    /*private void cancel(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        response.sendRedirect("Speaker.jsp");
    }*/
}