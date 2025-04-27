package com.HRmanagementsystem.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@WebServlet("/static/*")
public class StaticContentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String filePath = "/static" + pathInfo;
        InputStream inputStream = getServletContext().getResourceAsStream(filePath);

        if (inputStream == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // Set appropriate content type
        String mimeType = getServletContext().getMimeType(filePath);
        response.setContentType(mimeType != null ? mimeType : "application/octet-stream");

        // Copy stream to response using Java standard IO
        try (OutputStream outputStream = response.getOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        } finally {
            inputStream.close();
        }
    }
}