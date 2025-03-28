<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DAIKON SUSHI</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body { padding-bottom: 60px; }
        .top-bar { position: fixed; top: 0; width: 100%; background: white; padding: 10px; text-align: center; z-index: 1000; border-bottom: 1px solid #ddd; }
        .logo { width: 40px; height: 40px; border-radius: 50%; }
        .bottom-menu { position: fixed; bottom: 0; width: 100%; background: white; padding: 10px 0; text-align: center; display: flex; justify-content: space-around; border-top: 1px solid #ddd; }
        .menu-item { flex: 1; text-align: center; }
        .slider img { width: 100%; height: 150px; object-fit: cover; }
        .menu-list { padding-top: 60px; }
    </style>
</head>
<body>
    <div class="top-bar">
        <img src="logo.png" alt="DAIKON SUSHI" class="logo">
    </div>
    
    <div class="container mt-5 pt-5">
        <div id="promoSlider" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="promo1.jpg" class="d-block w-100 slider" alt="Акция 1">
                </div>
                <div class="carousel-item">
                    <img src="promo2.jpg" class="d-block w-100 slider" alt="Акция 2">
                </div>
            </div>
        </div>
    </div>
    
    <div class="container menu-list">
        <button class="btn btn-primary w-100 my-3">Переключить вид</button>
        <div class="menu-item">
            <img src="sushi.jpg" class="rounded-circle" width="80">
            <div>
                <h5>Суши и роллы</h5>
                <p>Вкусные роллы по доступным ценам</p>
                <p>Цена: 1500 тг</p>
                <button class="btn btn-success">Добавить в корзину</button>
            </div>
        </div>
    </div>
    
    <div class="bottom-menu">
        <div class="menu-item" onclick="scrollToTop()">📜<br>Меню</div>
        <div class="menu-item" onclick="openPopup('deliveryPopup')">🚚<br>Доставка</div>
        <div class="menu-item" onclick="openPopup('cartPopup')">🛒<br>Корзина</div>
    </div>
    
    <script>
        function scrollToTop() {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
        function openPopup(id) {
            alert("Открывается окно: " + id);
        }
    </script>
</body>
</html>
