<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WedWise Menu</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">
    <style>
        html, body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            height: 100%;
            font-family: 'Poppins', sans-serif;
        }

        /* Fullscreen Video Background */
        #background-video {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            object-fit: cover;
            z-index: -1;
            opacity: 1;
            filter: brightness(0.9); /* Helps buttons/text pop */
        }

        /* Star Twinkle Overlay */
        .stars {
            width: 100%;
            height: 100%;
            background: transparent;
            position: absolute;
            z-index: 0;
        }

        .star {
            position: absolute;
            background: white;
            border-radius: 50%;
            opacity: 0.8;
            animation: twinkle 3s infinite ease-in-out;
        }

        @keyframes twinkle {
            0%, 100% {
                opacity: 0.2;
                transform: scale(1);
            }
            50% {
                opacity: 1;
                transform: scale(1.5);
            }
        }

        .container {
            position: relative;
            z-index: 2;
            text-align: center;
            top: 50%;
            transform: translateY(-50%);
            animation: zoomIn 1s ease-in-out forwards;
        }

        @keyframes zoomIn {
            from {
                transform: scale(0.6) rotateX(45deg);
                opacity: 0;
            }
            to {
                transform: scale(1) rotateX(0deg);
                opacity: 1;
            }
        }

        .buttonBox {
            display: inline-block;
            margin: 20px;
            padding: 20px 40px;
            font-size: 20px;
            color: #fff;
            background-color: #ff2d55;
            border: none;
            border-radius: 8px;
            text-decoration: none; /* Removed underline */
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.6);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .buttonBox:hover {
            background-color: #ff5fad;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.8);
        }

        .buttonBox:active {
            transform: scale(0.98);
            box-shadow: inset 0 5px 10px rgba(0, 0, 0, 0.4);
        }
    </style>
</head>
<body>

<!-- 🎥 Wedding-Themed Video Background -->
<video autoplay muted loop id="background-video">
    <source src="resources/videos/Newindexvideo.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

<!-- ✨ Glowing Stars Overlay -->
<div class="stars" id="stars"></div>

<!-- 🚀 Button Container -->
<div class="container">
    <a href="customerSignIn.jsp">
        <button class="buttonBox">Customer Login</button>
    </a>
    <a href="vendorLogin.jsp">
        <button class="buttonBox">Vendor Login</button>
    </a>
</div>

<!-- ✨ Star Animation Script -->
<script>
    const starContainer = document.getElementById('stars');
    for (let i = 0; i < 100; i++) {
        const star = document.createElement('div');
        const size = Math.random() * 3 + 1;
        star.classList.add('star');
        star.style.width = `${size}px`;
        star.style.height = `${size}px`;
        star.style.top = `${Math.random() * 100}%`;
        star.style.left = `${Math.random() * 100}%`;
        star.style.animationDuration = `${Math.random() * 3 + 2}s`;
        starContainer.appendChild(star);
    }
</script>

</body>
</html>

