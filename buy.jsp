<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String pid = request.getParameter("pid");
    String pname = request.getParameter("pname");
    String price1 = request.getParameter("price");
    String acc_no = request.getParameter("acc_no");
    String pass = request.getParameter("pass");
    String uid = (String) session.getAttribute("uid");
    String uname = (String) session.getAttribute("uname");
    String upass = (String) session.getAttribute("upass");

    int price = Integer.parseInt(price1);
    int dprice = price + 250;

    Random RANDOM = new SecureRandom();
    int PASSWORD_LENGTH = 4;
    String letters = "0123456789";
    String id = "";
    for (int i = 0; i < PASSWORD_LENGTH; i++) {
        int index = (int) (RANDOM.nextDouble() * letters.length());
        id += letters.substring(index, index + 1);
    }

    String acc = acc_no + id;
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement sto = con.createStatement();
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    try {
        if (pass.contains(upass)) {
            ResultSet rt = st2.executeQuery("SELECT * FROM bank_account where acc_no='" + acc_no + "'");
            if (rt.next()) {
                int amount = rt.getInt("amount");
                if (amount < price) {
                    response.sendRedirect("Products.jsp?Insufficient_balance");
                } else {
                    int amt = amount - price;
                    int j = sto.executeUpdate("UPDATE bank_account SET amount='" + amt + "' WHERE acc_no='" + acc_no + "' ");

                    ResultSet rs1 = st1.executeQuery("SELECT * FROM product where id='" + pid + "'");
                    if (rs1.next()) {
                        String brand_name = rs1.getString("brand_name");
                        String category = rs1.getString("category");
                        String tag = rs1.getString("tag");

                        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                        Date date = new Date();
                        String time = dateFormat.format(date);
                        System.out.println("Date and Time : " + time);

                        int i = st.executeUpdate("insert into purchased (uname, uid, pid, pname, brand_name, price, category, tag, time, acc_no, acc, dprice) values ('" + uname + "','" + uid + "','" + pid + "','" + pname + "','" + brand_name + "','" + price + "','" + category + "','" + tag + "','" + time + "','" + acc_no + "','" + acc + "','" + dprice + "')");
                        if (i != 0) {
                            System.out.println("Product Ordered");
                            response.sendRedirect("Products.jsp?Product_puchased");
                        } else {
                            response.sendRedirect("Products.jsp?failed");
                            System.out.println("failed...");
                        }
                    } else {
                        response.sendRedirect("Product_details.jsp?Failed");
                    }
                }
            } else {
                response.sendRedirect("Products.jsp?Incorrect_Account_no");
            }
        } else {
            response.sendRedirect("Products.jsp?Incorrect_password");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>