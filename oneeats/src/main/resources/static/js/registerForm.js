      $(document).ready(function () {
        // submit 전에 필수 약관 동의 체크 검증, check_map에서 각 항목 유효성 검증되었는지
        $("#registerForm").submit(function (event) {
          event.preventDefault();

          for (let [key, value] of check_map) {
			console.log(key, value);
			if (value == false) {
				if (key == "id") {
					alert("아이디 중복확인을 해주세요.");
				} else if (key == "pwd") {
					alert("올바른 비밀번호를 입력해주세요.");
					$("#pwd").focus();
				} else if (key == "pwd_confirm") {
					alert("비밀번호 확인을 입력해주세요.");
				} else if (key == "busNo") {
					alert("사업자번호 인증을 해주세요.");
				} else if(key=="phone"){
					alert("휴대폰번호 인증을 해주세요.");
				} else {
					alert("다시 입력해주세요.");
					$("#" + key).focus();
				}
				return false;
			}
		}

          var checkboxes = $(".req_checkbox");
          var allChecked = true;
          for (var checkbox of checkboxes) {
            if (!$(checkbox).is(":checked")) {
              allChecked = false;
              $(checkbox).focus();
              break; // Exit the loop
            }
          }
          if (!allChecked) {
            alert("필수 규약에 동의해주세요.");
            return false;
          }

          $(this).unbind("submit").submit();
        });

        // 비밀번호가 비밀번호 확인과 같은지, 올바른 입력인지 검증
        $("#pwd").on("input", function () {
          var puttedText = $(this).val();
          pwd_input_text = puttedText;
          var regex = /[^a-zA-Z0-9!@#$%^&*()]/;
          var regex2 = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).+$/;
          if (puttedText.length < 8) {
            changeMessage("pwd", "비밀번호가 너무 짧습니다.", "red");
          } else if (puttedText.length > 12) {
            changeMessage("pwd", "비밀번호가 너무 깁니다.", "red");
          } else if (regex.test(puttedText)) {
            changeMessage(
              "pwd",
              "비밀번호에는 알파벳, 숫자, 혹은 특수문자(!@#$%^&*())만 사용할 수 있습니다.",
              "red"
            );
          } else if (!regex2.test(puttedText)) {
            changeMessage(
              "pwd",
              "비밀번호에는 영숫자와 특수문자가 하나 이상 들어가 있어야 합니다.",
              "red"
            );
          } else {
            if (pwd_check_text != "-1" && pwd_check_text != puttedText) {
              changeMessage(
                "pwd_confirm",
                "비밀번호가 일치하지 않습니다.",
                "red"
              );
              check_map.set("pwd_confirm", false);
            } else {
              changeMessage("pwd_confirm", "", "blue");
              check_map.set("pwd_confirm", true);
            }
            changeMessage("pwd", "", "blue");
            check_map.set("pwd", true);
          }
        });

        $("#pwd_confirm").on("input", function () {
          var puttedText = $(this).val();
          var regex = /[^a-zA-Z0-9!@#~]/;
          pwd_check_text = puttedText;
          if (puttedText != pwd_input_text) {
            changeMessage(
              "pwd_confirm",
              "비밀번호가 일치하지 않습니다.",
              "red"
            );
            check_map.set("pwd_confirm", false);
          } else {
            changeMessage("pwd_confirm", "", "blue");
            check_map.set("pwd_confirm", true);
          }
        });

        $("input[name=name]").on("input", function () {
          var puttedText = $(this).val();
          if (puttedText.length < 1) {
            changeMessage("name", "이름을 입력해주세요", "red");
          } else {
            changeMessage("name", "", "blue");
          }
        });

        $("#allcheck").change(function () {
          if ($(this).is(":checked")) {
            $(".check_box").prop("checked", true);
          } else {
            $(".check_box").prop("checked", false);
          }
        });

        $("input[name=id]").on("input", function () {
          check_map.set("id", false);
        });
      });

      // 아이디 중복 검증
      function checkDuplicateId() {
        var idString = $("input[name=id]").val();
        var regex = /[^a-zA-Z0-9]/;
        if (idString.length < 1) {
          changeMessage("id", "아이디를 입력해주세요", "red");
        } else if (idString.length < 4) {
          changeMessage("id", "아이디는 최소 4글자 이상이어야 합니다.", "red");
        } else if (regex.test(idString)) {
          changeMessage(
            "id",
            "아이디에는 알파벳과 숫자만 쓸 수 있습니다.",
            "red"
          );
        } else {
          var path = contextPath + "/checkDuplicatedId.do";
          $.ajax({
            type: "post",
            async: true,
            dataType: "text",
            data: {
              id: idString,
            },
            url: path,
            success: function (data, textStatus) {
              if (data == "success") {
                changeMessage("id", "사용할 수 있는 아이디입니다.", "blue");
                check_map.set("id", true);
                console.log(check_map);
              } else if (data == "fail") {
                changeMessage("id", "이미 사용중인 아이디입니다.", "red");
              } else {
                changeMessage("id", "원인불명의 에러 발생", "red");
              }
            },
            error: function (xhr, status, error) {
              alert("에러발생");
            },
            complete: function (data) {
              // alert("성공적으로 처리되었습니다.");
            },
          });
        }
      }

      function fn_phone_inzung() {
        var inzung_bunho = $("#inzung").val();

        $.ajax({
          type: "post",
          async: true,
          dataType: "text",
          data: {
            bunho: inzung_bunho,
          },
          url: contextPath + "/phoneInzung.do",
          success: function (data, textStatus) {
            if (data == "success") {
              changeMessage("inzung", "인증되었습니다.", "blue");
              check_map.set("phone", true);
              $("#phone").attr("readonly", "readonly");
              $("#inzung").attr("readonly", "readonly");
            } else if (data == "fail") {
              changeMessage("inzung", "인증되지 않았습니다.", "red");
            } else {
              changeMessage("inzung", "원인불명의 에러 발생", "red");
            }
          },
          error: function (xhr, status, error) {
            alert("에러발생");
          },
          complete: function (data) {
            // alert("성공적으로 처리되었습니다.");
          },
        });
      }

      function fn_open_inzung_row() {
        var phone_text = $("input[name=phone]").val();
        var regex = /[^a-zA-Z0-9]/;
        phone_text = phone_text.replace(/-/g, "");

        if (phone_text.length < 8 || regex.test(phone_text)) {
          alert("휴대폰 번호를 입력해주세요");
          $("input[name=phone]").focus();
        } else {
          $("input[name=phone]").val(phone_text);
          $(".inzung_row").show();
        }
      }

      function changeMessage(elname, str, clr) {
        $("#errmsg_" + elname).removeClass();
        $("#errmsg_" + elname).addClass(clr + "Text");
        if (str.length < 1) {
          $("#errmsg_" + elname).html("&nbsp;");
        } else {
          $("#errmsg_" + elname).text(str);
        }
      }
    