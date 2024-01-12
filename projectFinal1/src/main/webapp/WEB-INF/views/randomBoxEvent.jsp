<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#roulette-container {
	position: relative;
	width: 300px;
	height: 300px;
	margin: 50px auto;
	border: 2px solid #000;
	border-radius: 50%;
	overflow: hidden;
}

#roulette {
	width: 100%;
	height: 100%;
	transition: transform 3s ease-out;
}

.roulette-slot {
	position: absolute;
	width: 100%;
	height: 100%;
	clip-path: polygon(50% 50%, 100% 0%, 100% 100%);
}

.slot-0 {
	background-color: #f00;
	transform: rotate(0deg);
}

.slot-1 {
	background-color: #0f0;
	transform: rotate(45deg);
}

.slot-2 {
	background-color: #00f;
	transform: rotate(90deg);
}

.slot-3 {
	background-color: #ff0;
	transform: rotate(135deg);
}

.slot-4 {
	background-color: #f0f;
	transform: rotate(180deg);
}

.slot-5 {
	background-color: #0ff;
	transform: rotate(225deg);
}

.slot-6 {
	background-color: #fff;
	transform: rotate(270deg);
}

.slot-7 {
	background-color: #888;
	transform: rotate(315deg);
}
</style>
<div class="row">
	<div class="col-10 offset-1">

		<div id="roulette-container">
			<div id="roulette">
				<div class="roulette-slot slot-0"></div>
				<div class="roulette-slot slot-1"></div>
				<div class="roulette-slot slot-2"></div>
				<div class="roulette-slot slot-3"></div>
				<div class="roulette-slot slot-4"></div>
				<div class="roulette-slot slot-5"></div>
				<div class="roulette-slot slot-6"></div>
				<div class="roulette-slot slot-7"></div>
			</div>
		</div>

	</div>
</div>

<script>
        let currentRotation = 0;
        const roulette = document.getElementById('roulette');

        function spinRoulette() {
            const randomRotation = Math.floor(Math.random() * 360);
            currentRotation += 360 * 5 + randomRotation;
            roulette.style.transform = `rotate(${currentRotation}deg)`;
        }

        document.getElementById('roulette-container').addEventListener('click', spinRoulette);
</script>