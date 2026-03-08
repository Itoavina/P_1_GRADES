<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - Grade Management System</title>
    <style>
        :root {
            --primary: #4f46e5;
            --success: #10b981;
            --danger: #ef4444;
            --bg: #f9fafb;
            --text: #111827;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg);
            color: var(--text);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: white;
            padding: 3rem;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }
        h1 {
            color: var(--primary);
            margin-bottom: 1.5rem;
        }
        .status-box {
            padding: 1rem;
            border-radius: 0.5rem;
            margin-top: 1.5rem;
            font-weight: 500;
        }
        .success {
            background-color: #ecfdf5;
            color: var(--success);
            border: 1px solid #10b981;
        }
        .fail {
            background-color: #fef2f2;
            color: var(--danger);
            border: 1px solid #ef4444;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Grade Management System</h1>
        <p>${message}</p>
        
        <div class="status-box ${dbStatus.contains('Failed') ? 'fail' : 'success'}">
            <strong>Database Status:</strong><br>
            ${dbStatus}
        </div>
    </div>
</body>
</html>
