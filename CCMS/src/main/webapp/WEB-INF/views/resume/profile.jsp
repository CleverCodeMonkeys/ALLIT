<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.inputGroup {
  background-color: #fff;
  display: block;
  margin: 10px 0;
  position: relative;
}
.inputGroup label {
  padding: 12px 30px;
  width: 100%;
  display: block;
  text-align: left;
  color: #3C454C;
  cursor: pointer;
  position: relative;
  z-index: 2;
  transition: color 200ms ease-in;
  overflow: hidden;
}
.inputGroup label:before {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  content: '';
  background-color: #5562eb;
  position: absolute;
  left: 50%;
  top: 50%;
  -webkit-transform: translate(-50%, -50%) scale3d(1, 1, 1);
          transform: translate(-50%, -50%) scale3d(1, 1, 1);
  transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1);
  opacity: 0;
  z-index: -1;
}
.inputGroup label:after {
  width: 32px;
  height: 32px;
  content: '';
  border: 2px solid #D1D7DC;
  background-color: #fff;
  background-image: url("data:image/svg+xml,%3Csvg width='32' height='32' viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M5.414 11L4 12.414l5.414 5.414L20.828 6.414 19.414 5l-10 10z' fill='%23fff' fill-rule='nonzero'/%3E%3C/svg%3E ");
  background-repeat: no-repeat;
  background-position: 2px 3px;
  border-radius: 50%;
  z-index: 2;
  position: absolute;
  right: 30px;
  top: 50%;
  -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
  cursor: pointer;
  transition: all 200ms ease-in;
}
.inputGroup input:checked ~ label {
  color: #fff;
}
.inputGroup input:checked ~ label:before {
  -webkit-transform: translate(-50%, -50%) scale3d(56, 56, 1);
          transform: translate(-50%, -50%) scale3d(56, 56, 1);
  opacity: 1;
}
.inputGroup input:checked ~ label:after {
  background-color: #54E0C7;
  border-color: #54E0C7;
}
.inputGroup input {
  width: 32px;
  height: 32px;
  order: 1;
  z-index: 2;
  position: absolute;
  right: 30px;
  top: 50%;
  -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
  cursor: pointer;
  visibility: hidden;
}

.form {
  padding: 0 16px;
  max-width: 550px;
  margin: 50px auto;
  font-size: 18px;
  font-weight: 600;
  line-height: 36px;
  box-sizing: border-box;
}

*,
*::before,
*::after {
  box-sizing: inherit;
}
</style>
<div class = "w3-row w3-white" style="font-family: penB;">
    <div class ="w3-col m2 w3-display-container w3-center">
       <img id = "photoImage" style ="width: 100%; height:140px; 
       border: 1px solid lightgrey; cursor: pointer;" onclick='changeImage();'>
        <div class="w3-display-topright"><button type="button" class ="w3-button w3-pink" onclick="delPhoto();">X</button></div>
        <input type="hidden" name="photo" value="test.jpg" id ="hiddenPhoto">
    </div>
    
    <div class ="w3-col m10 w3-center w3-display-container lang-span" style="padding-top: 6%; padding-left: 2%;">
       <span class ="w3-display-topright w3-padding w3-hover-light-green" style ="font-size: 1.5em; cursor: pointer;"
       onclick="openLang();">할 수 있는 언어</span>
      <c:forTokens items="${resume.resume.language}" delims="," var="language">
         <span class="w3-tag w3-xlarge w3-padding w3-round-large langSpan" 
         style="transform:rotate(-5deg)">${language}</span>
      </c:forTokens>
    </div>
</div>

<!-- Language Modal -->
<div id="langModal" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4" style="width: 600px;">
      <header class="w3-container w3-amber"> 
        <span onclick="document.getElementById('langModal').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2 style ="font-family: whiteCloud">할수 있는 언어</h2>
      </header>
      
      <div class="w3-container w3-light-grey" style ="font-family: penB">
         <form class="form">
        <div class="inputGroup">
          <input id="option1" name="option" type="checkbox" onclick="CountChecked(this);" value ="Java"/>
          <label for="option1">Java</label>
        </div>
        
        <div class="inputGroup">
          <input id="option2" name="option" type="checkbox" onclick="CountChecked(this);" value ="C"/>
          <label for="option2">C</label>
        </div>
        
        <div class="inputGroup">
          <input id="option3" name="option" type="checkbox" onclick="CountChecked(this);" value ="C++"/>
          <label for="option3">C++</label>
        </div>
        
        <div class="inputGroup">
          <input id="option4" name="option" type="checkbox" onclick="CountChecked(this);" value ="Python"/>
          <label for="option4">Python</label>
        </div>
        
        <div class="inputGroup">
          <input id="option5" name="option" type="checkbox" onclick="CountChecked(this);" value ="C#"/>
          <label for="option5">C#</label>
        </div>
        
        <div class="inputGroup">
          <input id="option6" name="option" type="checkbox" onclick="CountChecked(this);" value ="JavaScript"/>
          <label for="option6">JavaScript</label>
        </div>
        
        <div class="inputGroup">
          <input id="option7" name="option" type="checkbox" onclick="CountChecked(this);" value ="PHP"/>
          <label for="option7">PHP</label>
        </div>
        
        <div class="inputGroup">
          <input id="option8" name="option" type="checkbox" onclick="CountChecked(this);" value ="Assembly"/>
          <label for="option8">Assembly</label>
        </div>
        
        <div class="inputGroup">
          <input id="option10" name="option" type="checkbox" onclick="CountChecked(this);" value ="SQL"/>
          <label for="option10">SQL</label>
        </div>
        
        <div class="inputGroup">
          <input id="option9" name="option" type="checkbox" onclick="CountChecked(this);" value="HTML/CSS"/>
          <label for="option9">HTML/CSS</label>
        </div>
        
        <div class="inputGroup">
          <input id="option11" name="option" type="checkbox" onclick="CountChecked(this);" value="기타"/>
          <label for="option11">기타</label>
        </div>
      </form> 
      </div>
      
      <footer class="w3-white  w3-center" style ="font-family: penB">
          <button type ="button" class = "w3-pink w3-btn w3-right" style ="width: 50%; padding-top: 3%; padding-bottom: 3%;" onclick="cancelLang();">취소</button>
          <button type ="button" class = "w3-lime w3-btn" style ="width: 50%; padding-top: 3%; padding-bottom: 3%;" onclick="saveLang();">저장</button>
      </footer>      
    </div>
 </div>

<!-- Photo Modal -->
<div id="photoModal" class="w3-modal">
    <div class="w3-modal-content  w3-animate-top w3-card-4" style="width: 500px;">
      <header class="w3-container w3-amber"> 
        <span onclick="document.getElementById('photoModal').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2 style ="font-family: whiteCloud">사진등록</h2>
      </header>
      <div class="w3-container" style ="margin-top: 2%; margin-bottom: 2%;">
        <!-- 사진 등록하기 -->
        <div class = "w3-row w3-center">  
        	<img id ="modalPhoto" style ="width: 400px; height:400px;"/>
        	<form id="test">
        		<input type ="file" id ="input-file" name="files"/>
        	</form>
        </div>
      </div>
      <footer class="w3-teal" style ="font-family: penB">
       <button type ="button" class = "w3-pink w3-btn w3-right" style ="width: 50%; padding-top: 1%; padding-bottom: 1%;" onclick="cancelPhoto();">취소</button>
       <button type ="button" class = "w3-light-green w3-btn" style ="width: 50%; padding-top: 1%; padding-bottom: 1%;" onclick="savePhoto();">등록</button>
      </footer>
    </div>
 </div>


<script>
var defaultImage = 'monkeyLogo.jpg';

$('#input-file').on('change', function(ev){
	
	if(window.FileReader){
		if (!$(this)[0].files[0].type.match(/image\//)){
			alert('이미지 파일만 가능합니다');
			$(this).val('');
			return false;
		}else{
			var reader = new FileReader();
			reader.onload = function(e){
				var src = e.target.result;
				console.log("들어온거긴 한건가");
				$('#modalPhoto').attr('src', src);
			}
			reader.readAsDataURL($(this)[0].files[0]);
			console.log('여기까지 왔습니다');		
		}	
	}
});

/* //설정 시작
var maxChecked = 5;
var totalChecked = 0;*/
// 설정 끝
function CountChecked(field) {
   /* if (field.checked)
   totalChecked += 1;
   else
   totalChecked -= 1; 
   if (totalChecked > maxChecked) {
   alert ("최대 5개 까지만 가능합니다.");
   field.checked = false;
   totalChecked -= 1;
   }  */
}

function savePhoto(){
	//Save Photo
	
	var form = $('#test');
	
	form.method = "POST";
	form.enctype = "multipart/form-data";
	
	data = new FormData();
	data.append("file", $("#input-file")[0]);
	console.log(data);
	console.log(data.file);
	 $.ajax({
		url : "${pageContext.request.contextPath}/resume/saveImage.resume",
		type: "POST",
		data: data,
		cache : false,
        contentType : false,
        processData : false,
		success: function(data){
			console.log('success');
		}, error : function(data){
			
		}
	}); 
}

function cancelPhoto(){
	document.getElementById('photoModal').style.display='none';
	$('#input-file').val("");
}

//upload File Image.
function changeImage(){
	document.getElementById('photoModal').style.display='block';
	//initialize photo	
	$('#modalPhoto').attr('src', $('#photoImage').attr('src'));
}

function delPhoto(){
   var value = $('#hiddenPhoto').val();
   if(value == defaultImage) alert('선택된 사진이 없습니다.');
   else{
      if(confirm('사진을 취소하겠습니까?')){
         var location = '${pageContext.request.contextPath}/resources/images/logo/monkeyLogo.jpg';
         $('#photoImage').attr('src', location);
         $('#hiddenPhoto').val(defaultImage);
      }
   }
}

function openLang(){	
	// Check Box Setting.
	
	$('input:checkbox[name="option"]').each(function(index) {
		var span = this.value;
		var result = false;
		this.checked = false;
		
		$('.langSpan').each(function(index){
			if(span == $(this).text()){
				result = true;
			}
		});		
		
		if(result){
			this.checked = true;
		}
	});
	
	document.getElementById('langModal').style.display='block';
}

// Make for Color Span
$( document ).ready(function() {
   $('.w3-tag').each(function(index){
      var getText = $(this).text();   
      $(this).addClass(makeColorLang(getText));
   });
   
   // Setting Picture Image
  var photo =  '${resume.resume.photo}';
  var location = '${pageContext.request.contextPath}/resources/images/logo/';
  if(photo == ""){
     location += defaultImage;
     $('#photoImage').attr('src', location);
     $('#modalPhoto').attr('src', location);
     $('#hiddenPhoto').val(defaultImage);
  }else{
     location += photo;
     $('#photoImage').attr('src', location);
     $('#modalPhoto').attr('src', location);
     $('#hiddenPhoto').val(photo);
  }
});

function saveLang(){
   var makeString = "";
   var isChecked = false;
   $('.langSpan').remove();
   
    $('input:checkbox[name="option"]').each(function(index) {
         if(this.checked){
            isChecked = true;
            makeString += this.value + ",";
            var colorTag = makeColorLang(this.value);
            var html = "<span class='w3-tag w3-xlarge w3-padding w3-round-large langSpan " + colorTag;
            html += "' style='transform:rotate(-5deg)'>";
            html += this.value;
            html += "</span>&nbsp;"
            $('.lang-span').append(html);                 
         }
         
         if(index == 10){ // 현재는 값이 Lang 10개라 이렇게 했지만... 나중에는 조심.
            if(isChecked){
               makeString = makeString.substring(0, makeString.length - 1);
            }
         }
    });    
   
    // 이값을 집어 넣는다.
    alert('언어 선택이 바뀌었습니다.');
    document.getElementById('langModal').style.display='none';
    
    $('#languageValue').val(makeString);
}

function cancelLang(){
   document.getElementById('langModal').style.display='none';
}

function makeColorLang(getText){
   var mClass = "";
    switch(getText){
         case 'Java' : mClass= 'w3-red'; break;
         case 'C': mClass = 'w3-blue'; break;
         case 'C++': mClass = 'w3-cyan'; break;
         case 'Python': mClass = 'w3-lime'; break;
         case 'C#': mClass = 'w3-indigo'; break;
         case 'JavaScript': mClass = 'w3-pink'; break;
         case 'PHP': mClass ='w3-amber'; break;
         case 'Assembly': mClass = 'w3-blue-grey'; break;
         case 'SQL': mClass = 'w3-teal'; break;
         case 'HTML/CSS' : mClass ='w3-deep-purple'; break;
         default: mClass ='w3-khaki'; 
      }    
    return mClass;
}


</script>