document.addEventListener('DOMContentLoaded', () => {
    const circle = document.querySelector('.circle');
    const button = document.querySelector('.button');
    const body = document.body;
    const popupBox = document.querySelector('.popup-box');
    const boxContainer = document.querySelector('.box-container');
    const topRightButton = document.getElementById('top-right-button');

    let currentX = 50;
    let currentY = 50;
    let targetX = 50;
    let targetY = 50;

    // 마우스 움직임 이벤트 - 페이지 어디에 있든지 그라데이션을 이동
    document.addEventListener('mousemove', (e) => {
        const rect = circle.getBoundingClientRect();
        targetX = ((e.clientX - rect.left) / rect.width) * 100;
        targetY = ((e.clientY - rect.top) / rect.height) * 100;
    });

    function update() {
        currentX += (targetX - currentX) * 0.1;
        currentY += (targetY - currentY) * 0.1;

        const gradientColor = body.classList.contains('inverted') ? '#ff9999' : '#0066ff';
        circle.style.background = `radial-gradient(circle at ${currentX}% ${currentY}%, ${gradientColor} 0%, transparent 75%)`;

        requestAnimationFrame(update);
    }

    // CLICK 버튼 클릭 이벤트
    button.addEventListener('click', () => {
        body.classList.toggle('inverted');
        popupBox.classList.toggle('show');

        if (body.classList.contains('inverted')) {
            boxContainer.style.display = 'flex';
            setTimeout(() => {
                boxContainer.classList.add('show');
            }, 10);
        } else {
            boxContainer.classList.remove('show');
            setTimeout(() => {
                boxContainer.style.display = 'none';
            }, 600);
        }
    });

    update(); // 애니메이션 업데이트 시작
});
