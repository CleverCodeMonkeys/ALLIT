<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.dropdown-el {
	  /* min-width: 12em; */
	  margin-top: 9px;
	  width:100%;
	  position: relative;
	  display: inline-block;
	  margin-right: 1em;
	  min-height: 2em;
	  max-height: 2em;
	  overflow: hidden;
	  top: .5em;
	  cursor: pointer;
	  text-align: left;
	  white-space: nowrap;
	  color: #444;
	  outline: none;
	  /* border: .06em solid transparent; */
	  /* border-radius: 1em; */
	  border-bottom: 2px solid #c8ccd4;
	  background-color: #fff;
	  z-index: 2px;
	  transition: 0.3s all ease-in-out;
	}
	.dropdown-el input {
	  display: none;
	}
	.dropdown-el label {
	  border-top: .06em solid #d9d9d9;
	  display: block;
	  height: 2em;
	  line-height: 2em;
	  padding-left: 1em;
	  padding-right: 3em;
	  cursor: pointer;
	  position: relative;
	  transition: 0.3s color ease-in-out;
	}
	.dropdown-el label:nth-child(2) {
	  margin-top: 2em;
	  border-top: .06em solid #d9d9d9;
	}
	.dropdown-el input:checked + label {
	  display: block;
	  border-top: none;
	  position: absolute;
	  top: 0;
	}
	.dropdown-el input:checked + label:nth-child(2) {
	  margin-top: 0;
	  position: relative;
	}
	.dropdown-el::after {
	  content: "";
	  position: absolute;
	  right: 0.8em;
	  top: 0.9em;
	  border: 0.3em solid #3694d7;
	  border-color: #3694d7 transparent transparent transparent;
	  transition: .4s all ease-in-out;
	}
	.dropdown-el.expanded {
	  border: 0.06em solid #3694d7;
	  background: #fff;
	  border-radius: .25em;
	  padding: 0;
	  box-shadow: rgba(0, 0, 0, 0.1) 3px 3px 5px 0px;
	  max-height: 15em;
	  z-index: 1px;
	  position: relative;
	}
	.dropdown-el.expanded label {
	  border-top: .06em solid #d9d9d9;
	}
	.dropdown-el.expanded label:hover {
	  color: #3694d7;
	}
	.dropdown-el.expanded input:checked + label {
	  color: #3694d7;
	}
	.dropdown-el.expanded::after {
	  transform: rotate(-180deg);
	  top: .55em;
	}
</style>

<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
	<div class ="w3-col m2 w3-center">
		<%-- <label class="inp">
	           <input type="text" placeholder="&nbsp;" name = "schoolType"
	            class="cInput" value ="${resume.degreeList[0].schoolType}">
	           <span class="label">학교타입</span>
	           <span class="border"></span>
	    </label> --%>
	    <span class="dropdown-el">
  			<input type="radio" name="schoolType" value="default" checked="checked" class="sort-relevance"><label for="sort-relevance">학교타입</label>
  			<input type="radio" name="schoolType" value="대학교(4년) 졸업" class="sort-best"><label for="sort-best">대학교(4년) 졸업</label>
  			<input type="radio" name="schoolType" value="대학(2,3년) 졸업" class="sort-low"><label for="sort-low">대학(2,3년) 졸업</label>
  			<input type="radio" name="schoolType" value="대학원 졸업" class="sort-high"><label for="sort-high">대학원 졸업</label>
  			<input type="radio" name="schoolType" value="고등학교 졸업" class="sort-brand"><label for="sort-brand">고등학교 졸업</label>
		</span>
	</div>
	
	<div class ="w3-col m4 w3-center">
		<label class="inp">
	           <input type="text" placeholder="&nbsp;" name = "universityName" 
	           class="cInput" value = "${resume.degreeList[0].schoolName}">
	           <span class="label">학교명</span>
	           <span class="border"></span>
	    </label>
	</div>
	
	<div class ="w3-col m3 w3-center">
		<label class="inp">
	            <input type="date" placeholder="&nbsp;" 
	            name = "enrollDate" class="cInput" value ="${resume.degreeList[0].enrollDate}">
	            <span class="label">입학일</span>
	            <span class="border"></span>
	    </label>
	</div>
	
	<div class ="w3-col m3 w3-center">
		<label class="inp">
	            <input type="date" placeholder="&nbsp;" name = "graduDate" 
	            class="cInput" value ="${resume.degreeList[0].graduDate}">
	            <span class="label">졸업일</span>
	            <span class="border"></span>
	    </label>
	</div>	
</div>

<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
	<div class ="w3-col m6 w3-center">
		<label class="inp">
	           <input type="text" placeholder="&nbsp;" name = "major" 
	           class="cInput" value ="${resume.degreeList[0].major}">
	           <span class="label">전공명</span>
	           <span class="border"></span>
	    </label>
	</div>
	
	<div class ="w3-col m3 w3-center">
		<label class="inp">
	            <input type="number" placeholder="&nbsp;" name = "score" 
	            class="cInput" value ="${resume.degreeList[0].score}">
	            <span class="label">학점</span>
	            <span class="border"></span>
	    </label>
	</div>	
	
	<div class ="w3-col m3 w3-center">
		<label class="inp">
	            <input type="number" placeholder="&nbsp;" name = "totalScore" 
	            class="cInput" value ="${resume.degreeList[0].totalScore}">
	            <span class="label">총점</span>
	            <span class="border"></span>
	    </label>
	</div>	
</div>

<script>
	$('.dropdown-el').click(function(e) {
		  e.preventDefault();
		  e.stopPropagation();
		  $(this).toggleClass('expanded');
		  $('.'+$(e.target).attr('for')).prop('checked',true);
		});
		$(document).click(function() {
		  $('.dropdown-el').removeClass('expanded');
	});
		
	$( document ).ready(function() {
		$('.dropdown-el').each(function(index){
			if(index == 0)
			{
				var value = '${resume.degreeList[0].schoolType}';
				$(this).children('input').each(function(index){
					if(value == $(this).val()){
						$(this).attr('checked', true);
					}
				});
			}
		});
	});	
</script>