$('#table_selected_candidate').DataTable({
    "bProcessing": true,
    "bServerSide": true,
    "responsive": true,
    "order": [[0, 'desc']],
    "sAjaxSource": domain + 'schedule/cfc/selected_candidate.cfc?method=dataTable',
    "lengthMenu": [
        [5, 10, 25, 50],
        [5, 10, 25, 50]
    ],
    "rowReorder": {
        selector: 'td:nth-child(2)'
    },
    columns: [{
            title: 'Id',
            name: "CandidateId",
            class: "candidate_column0"
        },
        {
            title: 'Name',
            name: "FIRSTNAME",
            class: "candidate_column1"
        },
        {
            title: 'Schdeule Date',
            name: "ScheduleDate",
            class: "candidate_column2"
        },
        {
            title: 'Schdeule Time',
            name: "ScheduleTime",
            class: "candidate_column3"
        },
        {
            title: 'Post Applied',
            name: "JobPosition",
            class: "candidate_column4"
        },
        {
            title: 'Interview Round',
            name: "Name",
            class: "candidate_column4"
        },
        {
            title: "Action",
            orderable: false,
            data: null,
            class: "dt-head-center",
            'render': function(data, type, row) {
                //row[8]     next_schdule_status
                //row[9]  Final_Round
                if ((row[8] == 0) && (row[9] == 0) && (row[10] == 2)) {
                    var schedule = '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Schedule\" onclick=\"return schedule_candidate(\'' + row[0] + '\',\'' + row[7] + '\')\" class=\"icon_vox \"><span class=\"material-icons\">assignment<\/span><\/a>';
                } else {
                    var schedule = '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Schedule\" onclick=\"return false\" class=\"icon_vox schedule_active\"><span class=\"material-icons\">assignment<\/span><\/a>';
                }
                return schedule + '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\"  data-column=\"' + row[0] + '\" title=\"View\" onclick=\"return view_schedule(\'' + row[11] + '\',\'' + row[0] + '\')\"  class=\"icon_vox view_candidate\"><span class=\"material-icons\">pageview<\/span><\/a>\r\n';
            }
        }
    ]

});
$('#table_schedule_candidate').DataTable({
    "bProcessing": true,
    "bServerSide": true,
    "order": [[0, 'desc']],
    "responsive": true,
    "sAjaxSource": domain + 'schedule/cfc/schedule_candidate.cfc?method=dataTable',
    "lengthMenu": [
        [5, 10, 25, 50],
        [5, 10, 25, 50]
    ],
    "rowReorder": {
        selector: 'td:nth-child(2)'
    },
    columns: [{
            title: 'Id',
            name: "CandidateId",
            class: "candidate_column0"
        },
        {
            title: 'Name',
            name: "FIRSTNAME",
            class: "candidate_column1"
        },
        {
            title: 'Schdeule Date',
            name: "ScheduleDate",
            class: "candidate_column2"
        },
        {
            title: 'Schdeule Time',
            name: "ScheduleTime",
            class: "candidate_column3"
        },
        {
            title: 'Post Applied',
            name: "JobPosition",
            class: "candidate_column4"
        },
        {
            title: 'Interview Round',
            name: "Name",
            class: "candidate_column4"
        },
        {
            title: "Action",
            orderable: false,
            data: null,
            class: "dt-head-center",
            'render': function(data, type, row) {
                //row[8]     next_schdule_status
                //row[9]  Final_Round
                if ((row[8] == 0) && (row[9] == 0) && (row[10] == 2)) {
                    var schedule = '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Schedule\" onclick=\"return schedule_candidate(\'' + row[0] + '\',\'' + row[7] + '\')\" class=\"icon_vox \"><span class=\"material-icons\">assignment<\/span><\/a>';
                } else {
                    var schedule = '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Schedule\" onclick=\"return false\" class=\"icon_vox schedule_active\"><span class=\"material-icons\">assignment<\/span><\/a>';
                }
                return schedule + '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\"  data-column=\"' + row[0] + '\" title=\"View\" onclick=\"return view_schedule(\'' + row[11] + '\',\'' + row[0] + '\')\"  class=\"icon_vox view_candidate\"><span class=\"material-icons\">pageview<\/span><\/a>\r\n';
            }
        }
    ]

});
$('#table_schedule_all').DataTable({
    "bProcessing": true,
    "bServerSide": true,
    "responsive": true,
    "order": [[0, 'desc']],
    "sAjaxSource": domain + 'schedule/cfc/schedule_list_all.cfc?method=dataTable',
    "lengthMenu": [
        [5, 10, 25, 50],
        [5, 10, 25, 50]
    ],
    "rowReorder": {
        selector: 'td:nth-child(2)'
    },
    columns: [{
            title: 'Id',
            name: "CandidateId",
            class: "candidate_column0"
        },
        {
            title: 'Name',
            name: "FIRSTNAME",
            class: "candidate_column1"
        },
        {
            title: 'Schdeule Date',
            name: "ScheduleDate",
            class: "candidate_column2"
        },
        {
            title: 'Schdeule Time',
            name: "ScheduleTime",
            class: "candidate_column3"
        },
        {
            title: 'Post Applied',
            name: "JobPosition",
            class: "candidate_column4"
        },
        {
            title: 'Interview Round',
            name: "Name",
            class: "candidate_column4"
        },
        {
            title: "Action",
            orderable: false,
            data: null,
            class: "dt-head-center",
            'render': function(data, type, row) {
                //row[8]     next_schdule_status
                //row[9]  Final_Round
                if ((row[8] == 0) && (row[9] == 0) && (row[10] == 2)) {
                    var schedule = '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Schedule\" onclick=\"return schedule_candidate(\'' + row[0] + '\',\'' + row[7] + '\')\" class=\"icon_vox \"><span class=\"material-icons\">assignment<\/span><\/a>';
                } else {
                    var schedule = '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Schedule\" onclick=\"return false\" class=\"icon_vox schedule_active\"><span class=\"material-icons\">assignment<\/span><\/a>';
                }
                return schedule + '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\"  data-column=\"' + row[0] + '\" title=\"View\" onclick=\"return view_schedule(\'' + row[11] + '\',\'' + row[0] + '\')\"  class=\"icon_vox view_candidate\"><span class=\"material-icons\">pageview<\/span><\/a>\r\n';
            }
        }
    ]

});
function changersstatus(schedule_id, status, overall_score, Final_Round_status) {
    $.ajax({
        url: domain + "cfc/database.cfc?method=change_statusschedule",
        type: "POST",
        data: {
            schedule_id: schedule_id,
            status: status,
            Total_Mark: overall_score,
            Final_Round_status: Final_Round_status
        },
        success: function(result) {
            alert("Successfully Changed");
            location.reload();
        }
    });
}

function view_schedule(schedule_id, candidate_id) {
    $.ajax({
        url: domain + "cfc/database.cfc?method=view_schedule_user",
        type: "POST",
        data: {
            schedule_id: schedule_id,
            candidate_id: candidate_id
        },
        success: function(result) {
            result = $.trim(result);
            $(".view_candidate_schedule_div").html(result);
        }
    });
    $("#view_candidate_user_modal").modal();
}

function review_candidate(schedule_id, round_id) {
    $.ajax({
        url: domain + "login_panel/cfc/db2_database.cfc?method=review_candidate_user",
        type: "POST",
        data: {
            schedule_id: schedule_id,
            round_id: round_id
        },
        success: function(result) {
            result = $.trim(result);
            $(".review_candidate_form_div").html(result);
        }
    });
    $("#review_candidate_user_modal").modal();
}
$("#review_candidate_user_modal").on("submit", "#review_candidate_user_form", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "login_panel/cfc/db2_database.cfc?method=review_candidate_user_submit",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            $(".modal-content").html("<center><div class='msg_header'><h3>Review Submited Successfully!!!</h3></div></center>");
            setTimeout(function() {
                location.reload();
            }, 3000);
        }
    });
});
$('#table_lay_selected').DataTable({
    "bProcessing": true,
    "bServerSide": true,
    "responsive": true,
    "order": [[4, 'desc']],
    "sAjaxSource": domain + 'login_panel/cfc/schedule_list.cfc?method=dataTable',
    "lengthMenu": [
        [5, 10, 25, 50],
        [5, 10, 25, 50]
    ],
    "rowReorder": {
        selector: 'td:nth-child(2)'
    },
    columns: [

        {
            title: 'Id',
            name: "CandidateId",
            class: "candidate_column0"
        },
        {
            title: 'Name',
            name: "FIRSTNAME",
            class: "candidate_column1"
        },
        {
            title: 'Email',
            name: "Interview Type",
            class: "candidate_column2"
        },
        {
            title: 'Experience',
            name: "EXPERIENCE",
            class: "candidate_column3"
        },
        {
            title: 'Post Applied',
            name: "JobPosition",
            class: "candidate_column4"
        },
        {
            title: "Action",
            orderable: false,
            data: null,
            class: "dt-head-center",
            'render': function(data, type, row) {
                //console.log(data);
                var review = '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Review\" onclick=\"return review_candidate(\'' + row[5] + '\',\'' + row[7] + '\')\" class=\"icon_vox \"><span class=\"material-icons\">assignment<\/span><\/a>';
                return review;
            }
        }
    ]
});

function schedule_candidate(id, job_id) {
    $.ajax({
        url: domain + "cfc/database.cfc?method=schedule_candidate_form",
        type: "POST",
        data: {
            candidate_id: id,
            job_id: job_id
        },
        success: function(result) {
            result = $.trim(result);
            $(".schedule_interview_form_div").html(result);
            $('#schedule_date').datetimepicker({
                minDate: moment(),
                format: 'DD/MM/YYYY'
            });
            $('#schedule_time').datetimepicker({
                minDate: moment(),
                format: 'HH:mm',
            });
        }
    });
    $("#schedule_interview_modal").modal();
}
$("#schedule_interview_modal").on("submit", "#add_schedulecandidate_form", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        url: domain + "cfc/database.cfc?method=add_schedulecandidate_form",
        type: "POST",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            if (result == "success") {
                $(".modal-content").html("<div class='msg_header'><h3>Scheduled Successfully!!!</h3></div>");
                setTimeout(function() {
                    location.reload();
                }, 3000);
            }
        }
    });
});
$('#job_vacancy_table').DataTable({
    "bProcessing": true,
    "bServerSide": true,
    "responsive": true,
    "sAjaxSource": domain + 'job_vacancy/cfc/job_vacancy_list.cfc?method=dataTable',
    "lengthMenu": [
        [5, 10, 25, 50],
        [5, 10, 25, 50]
    ],
    "rowReorder": {
        selector: 'td:nth-child(2)'
    },
    columns: [

        {
            title: 'Id',
            name: "JobVacancyId",
            class: "job_vacancy_list_column"
        },
        {
            title: 'JobPosition',
            name: "JobPosition",
            class: "job_vacancy_list_column"
        },
        {
            title: 'JobCode',
            name: "JobCode",
            class: "job_vacancy_list_column"
        },
        {
            title: 'Vacancy',
            name: "Vacancy",
            class: "job_vacancy_list_column"
        },
        {
            title: "Action",
            orderable: false,
            data: null,
            class: "dt-head-center",
            'render': function(data, type, row) {
                return '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Edit\"  onclick=\"return edit_job_vacancy(\'' + row[0] + '\')\" class=\"icon_vox can_list cl_edit\"><span class=\"material-icons\" >edit<\/span><\/a>\r\n<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Delete\" class=\"icon_vox \" onclick=\"return delete_job_vacancy(\'' + row[0] + '\')\" data-column=\"' + row[0] + '\" ><span class=\"material-icons\">delete<\/span><\/a>'
            }
        }
    ]
});
$("#selecting_interviewtypes_modal").on("submit", "#selecting_interviewtypes_form", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=selecting_skills_form_db",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            location.reload();
        }
    });
});
$("#jobvacancyedit_modal").on("submit", "#form_edit_job_vacancy", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=jobvacancyedit",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            var result_array = result.split(',');
            $("#jobvacancyedit_modal").modal('toggle');
            $.ajax({
                url: domain + "cfc/database.cfc?method=selectinskills_loop",
                type: "POST",
                data: {
                    job_vacancy_id: result_array[1],
                    job_rounds: result_array[0]
                },
                success: function(response) {
                    $("#selecting_skills_div").html(response);
                    $(".interviewtypes_skills2").select2({
                        placeholder: "Skills"
                    });
                    $("#selecting_skills_modal").modal();
                }
            });
        }
    });
});

function delete_job_vacancy(id) {
    $("#delete_modal_job_vacancy").modal();
    $("#action_id").val(id);
    $("#action_page").val("delete_job_vacancy");
}
$("#delete_modal_job_vacancy").on("click", "#confirm_delete_job_vacancy", function(e) {
    var action_page = $("#action_page").val();
    var action_id = $("#action_id").val();
    if (action_page == 'delete_job_vacancy') {
        job_vacancy_list_delete(action_id);
    }

});

function job_vacancy_list_delete(action_id) {
    $.ajax({
        url: domain + "cfc/database.cfc?method=job_vacancy_list_delete",
        type: "POST",
        data: {
            action_id: parseInt(action_id)
        },
        success: function(html) {
            alert("Success");
            location.reload();

        }
    });
}

function edit_job_vacancy(job_id) {
    $.ajax({
        url: domain + "cfc/database.cfc?method=edit_job_vacancy",
        type: "POST",
        data: {
            job_id: parseInt(job_id)
        },
        success: function(html) {
            $("#jobvacancy_modal_div").html(html);
            $(function() {
                $('#StartDate').datetimepicker({
                    format: 'DD/MM/YYYY'
                });
                $('#EndDate').datetimepicker({
                    useCurrent: false,
                    format: 'DD/MM/YYYY'
                });
                $("#StartDate").on("dp.change", function(e) {
                    $('#EndDate').data("DateTimePicker").minDate(e.date);
                });
                $("#EndDate").on("dp.change", function(e) {
                    $('#StartDate').data("DateTimePicker").maxDate(e.date);
                });
                $("#select_interview_type").select2({
                    placeholder: "Select Members"
                });
            });
            $("#jobvacancyedit_modal").modal();
        }
    });
}

$("#selectinground_modal").on("submit", "#selectinground_form", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=selectinground",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            var result_array = result.split(',');
            $(".modal-content").html("<div class='msg_header'><h3>Added Successfully!!!</h3></div>");
            setTimeout(function() {
                location.reload();
            }, 3000);
        }
    });
});
$("#job_vacancy_modal").on("submit", "#form_job_vacancy", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=insertjob_vacancy",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            var result_array = result.split(',');
            $('#job_vacancy_modal').modal('toggle');
            $.ajax({
                url: domain + "cfc/database.cfc?method=selectinground_loop",
                type: "POST",
                data: {
                    job_vacancy_id: result_array[0],
                    job_rounds: result_array[1]
                },
                success: function(response) {
                    $("#selectinground_div").html(response);
                    $("#interviewtypes_skills1").select2({
                        placeholder: "Skills"
                    });
                    $("#interviewtypes_skills2").select2({
                        placeholder: "Skills"
                    });
                    $("#interviewtypes_skills3").select2({
                        placeholder: "Skills"
                    });
                    $("#interviewtypes_skills4").select2({
                        placeholder: "Skills"
                    });
                    $("#interviewtypes_skills5").select2({
                        placeholder: "Skills"
                    });
                    $("#selectinground_modal").modal();
                }
            });
        }
    });
});
$(function() {
    var selectinground_modal_ar = [0, 0, 0, 0, 0];
    $("#selectinground_modal").on("change", ".interviewtypes", function(e) {
        var value_interviewtypes = $(this).val();

        if (jQuery.inArray(value_interviewtypes, selectinground_modal_ar) == -1) {
            selectinground_modal_ar[$('.interviewtypes').index(this)] = value_interviewtypes;

        } else {
            $(this).val("");
            selectinground_modal_ar[$('.interviewtypes').index(this)] = "";
            alert("Already Assigned");
        }
    });
});
$(".job_vacancy_but").click(function() {
    $("#job_vacancy_modal").modal();
});
$(function() {
    $('#StartDate').datetimepicker({
        minDate: moment(),
        format: 'DD/MM/YYYY'
    });
    $('#EndDate').datetimepicker({
        useCurrent: false,
        format: 'DD/MM/YYYY'
    });
    $("#StartDate").on("dp.change", function(e) {
        $('#EndDate').data("DateTimePicker").minDate(e.date);
    });
    $("#EndDate").on("dp.change", function(e) {
        $('#StartDate').data("DateTimePicker").maxDate(e.date);
    });
});
$(".add_panel_members_but").click(function() {

    $("#panelmemberadd_modal").modal();

});
$("#panelmemberedit_modal").on("submit", "#form_editmembers", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=editpanelmembers",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            if (result == "success") {
                $(".modal-content").html("<div class='msg_header'><h3>Edited Successfully!!!</h3></div>");
                setTimeout(function() {
                    location.reload();
                }, 3000);
            }
            //$("#myModal").css("display", "block");
        }
    });

});
$("#panelmemberadd_modal").on("submit", "#form_addmembers", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=addpanelmembers",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            if (result == "success") {
                $(".modal-content").html("<div class='msg_header'><h3>Insert Successfully!!!</h3></div>");
                setTimeout(function() {
                    location.reload();
                }, 3000);
            }
            //$("#myModal").css("display", "block");
        }
    });

});
$('#panel_members_table').DataTable({
    "bProcessing": true,
    "bServerSide": true,
    "responsive": true,
    "sAjaxSource": domain + 'panel/cfc/panel_listmembers.cfc?method=dataTable',
    "lengthMenu": [
        [5, 10, 25, 50],
        [5, 10, 25, 50]
    ],
    "rowReorder": {
        selector: 'td:nth-child(2)'
    },
    columns: [

        {
            title: 'Id',
            name: "PanelId",
            class: "panelmember_list_column"
        },
        {
            title: 'Name',
            name: "FirstName",
            class: "panelmember_list_column"
        },
        {
            title: 'Email',
            name: "Email",
            class: "panelmember_list_column"
        },
        {
            title: 'Designation',
            name: "Designation",
            class: "panelmember_list_column"
        },
        {
            title: "Action",
            orderable: false,
            data: null,
            class: "dt-head-center",
            'render': function(data, type, row) {

                return '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Edit\"  onclick=\"return edit_panelmember(\'' + row[0] + '\')\" class=\"icon_vox can_list cl_edit\"><span class=\"material-icons\" >edit<\/span><\/a>\r\n<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Delete\" class=\"icon_vox \" onclick=\"return delete_panelmember(\'' + row[0] + '\')\" data-column=\"' + row[0] + '\" ><span class=\"material-icons\">delete<\/span><\/a>'
            }
        }
    ]
});

function addmembers_to(id) {
    $.ajax({
        url: domain + "cfc/database.cfc?method=membersinpanel",
        type: "POST",
        data: {
            id: id
        },
        success: function(html) {
            $(".add_memberinpanel_div").html(html);
            $("#membersinpanel_modal").modal();
            $("#select_membersinpanel").select2({
                placeholder: "Select Members"
            });
            $.ajax({
                url: domain + "cfc/database.cfc?method=getpaneldetails",
                type: "POST",
                data: {
                    panelid: id
                },
                success: function(response) {
                    response = $.trim(response);
                    if (typeof response !== 'undefined' || response == "") {
                        response = response.replace('"', '');
                        response = response.replace('"', '');
                        $("#PanelMembers_id").val(response);
                        result = response.split(',');
                        $("#select_membersinpanel").val(result);
                        $("#select_membersinpanel").trigger('change');
                    }
                }
            });
        }
    });
}
$("#membersinpanel_modal").on("submit", "#membersinpanel", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        url: domain + "cfc/database.cfc?method=panelmemberadd_form",
        type: "POST",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            if (result == "success") {
                $(".modal-content").html("<div class='msg_header'><h3>Added/Deleted Successfully!!!</h3></div>");
                setTimeout(function() {
                    location.reload();
                }, 3000);
            }
        }
    });
});

function edit_panelmember(id) {
    $.ajax({
        url: domain + "cfc/database.cfc?method=edit_panelmember",
        type: "POST",
        data: {
            action_id: parseInt(id)
        },
        success: function(html) {
            $(".edit_panelmember_form_div").html(html);
            $("#panelmemberedit_modal").modal();
        }
    });
}

function delete_panelmember(id) {
    $("#delete_modal_panelmember").modal();
    $("#action_id").val(id);
    $("#action_page").val("delete_panelmember");
}
$("#delete_modal_panelmember").on("click", "#confirm_delete_panelmember", function(e) {
    var action_page = $("#action_page").val();
    var action_id = $("#action_id").val();
    if (action_page == 'delete_panelmember') {
        panelmember_list_delete(action_id);
    }

});

function panelmember_list_delete(action_id) {
    $.ajax({
        url: domain + "cfc/database.cfc?method=panelmember_list_delete",
        type: "POST",
        data: {
            action_id: parseInt(action_id)
        },
        success: function(html) {
            location.reload();
        }
    });
}
function edit_panel(id) {
    $.ajax({
        url: domain + "cfc/database.cfc?method=edit_panel",
        type: "POST",
        data: {
            action_id: parseInt(id)
        },
        success: function(html) {
            $(".edit_panel_form_div").html(html);
            $("#paneledit_modal").modal();
        }
    });
}
$(".edit_panel_form_div").on("submit", "#edit_panel_form", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=editpanel_save",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            if (result == "success") {
                $(".modal-content").html("<center><div class='msg_header'><h3>Edited Successfully!!!</h3></div></center>");
                setTimeout(function() {
                    location.reload();
                }, 3000);
            }
        }
    });
});
$(".add_panel_form_div").on("submit", "#add_panel_form", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=insertpanel",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            if (result == "success") {
                $(".modal-content").html("<center><div class='msg_header'><h3>Insert Successfully!!!</h3></div></center>");
                setTimeout(function() {
                    location.reload();
                }, 3000);
            }
        }
    });
});
function delete_panel(id) {
    $("#delete_modal_panel").modal();
    $("#action_id").val(id);
    $("#action_page").val("delete_panel");
}
$("#confirm_delete_panel").click(function() {
    var action_id = $("#action_id").val();
    $.ajax({
        url: domain + "cfc/database.cfc?method=delete_panel",
        type: "POST",
        data: {
            action_id: parseInt(action_id)
        },
        success: function(html) {
            alert("success");
            location.reload();
        }
    });
});
$('#panel_list').DataTable({
    "bProcessing": true,
    "bServerSide": true,
    "responsive": true,
    "sAjaxSource": domain + 'panel/cfc/panel_list.cfc?method=dataTable',
    "lengthMenu": [
        [5, 10, 25, 50],
        [5, 10, 25, 50]
    ],
    "rowReorder": {
        selector: 'td:nth-child(2)'
    },
    columns: [

        {
            title: 'Id',
            name: "PanelId",
            class: "panel_list_column"
        },
        {
            title: 'Name',
            name: "Name",
            class: "panel_list_column"
        },
        {
            title: "Action",
            orderable: false,
            data: null,
            class: "dt-head-center",
            'render': function(data, type, row) {

                return '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Edit\"  onclick=\"return edit_panel(\'' + row[0] + '\')\" class=\"icon_vox can_list cl_edit\"><span class=\"material-icons\" >edit<\/span><\/a>\r\n<a href=\"#\" data-toggle=\"tooltip\" onclick=\"return delete_panel(\'' + row[0] + '\')\"  data-placement=\"bottom\" title=\"Delete\" class=\"icon_vox delete_candidate\" data-column=\"' + row[0] + '\" ><span class=\"material-icons\">delete<\/span><\/a><a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Add Members\" class=\"icon_vox \" onclick=\"return addmembers_to(\'' + row[0] + '\')\" ><span class=\"material-icons\">add<\/span><\/a>'
            }
        }
    ]
});
$(".add_panel_but").click(function() {
    $("#paneladd_modal").modal();
});
$(".add_panel_form_div").on("submit", "#add_panel_form", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=insertpanel",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            if (result == "success") {
                $(".modal-content").html("<center><div class='msg_header'><h3>Insert Successfully!!!</h3></div></center>");
                setTimeout(function() {
                    location.reload();
                }, 3000);
            }
        }
    });

});
$(".add_candidate_form_div").on("submit", "#add_candidate_form", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=insertcandiate",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            if (result == "success") {
                $(".modal-content").html("<div class='msg_header'><h3>Insert Successfully!!!</h3></div>");
                setTimeout(function() {
                    location.reload();
                }, 3000);
            } else if (result == "fileExtension") {
                alert("Invalid fileExtension");
            } else if (result == "FileLimit") {
                alert("FileLimit Should not Exceed 1.5Mb");
            }
        }
    });
});

$(function() {
    var globalVars = {
        tableConfigs: null,
        tableId: $('table#table_lay')
    }
    var main = {
        register: function() {
            main.UI.register.apply();
            main.EVENTS.register.apply();
        },
        UI: {
            register: function() {
                main.UI.buildTable.apply();
            },
            buildTable: function() {
                globalVars.tableConfigs = globalVars.tableId.DataTable({
                    "bProcessing": true,
                    "bServerSide": true,
                    "responsive": true,
                    "sAjaxSource": domain + 'cfc/datatables.cfc?method=dataTable',
                    "lengthMenu": [
                        [5, 10, 25, 50],
                        [5, 10, 25, 50]
                    ],
                    "rowReorder": {
                        selector: 'td:nth-child(2)'
                    },
                    columns: [
                        {
                            title: 'Id',
                            name: "CandidateId",
                            class: "candidate_column0"
                        },
                        {
                            title: 'Name',
                            name: "FIRSTNAME",
                            class: "candidate_column1"
                        },
                        {
                            title: 'Email',
                            name: "EMAIL",
                            class: "candidate_column2"
                        },
                        {
                            title: 'Experience',
                            name: "EXPERIENCE",
                            class: "candidate_column3"
                        },
                        {
                            title: 'Post Applied',
                            name: "JobPosition",
                            class: "candidate_column4"
                        },
                        {
                            title: "Action",
                            orderable: false,
                            data: null,
                            class: "dt-head-center",
                            'render': function(data, type, row) {
                                console.log(data);
                                if (row[5] == '0') {
                                    var schedule = '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Schedule\" onclick=\"return schedule_candidate(\'' + row[0] + '\',\'' + row[6] + '\')\" class=\"icon_vox \"><span class=\"material-icons\">assignment<\/span><\/a>';
                                } else {
                                    var schedule = '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Schedule\" onclick=\"return false\" class=\"icon_vox schedule_active\"><span class=\"material-icons\">assignment<\/span><\/a>';
                                }
                                var links = '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Edit\"  onclick=\"return edit_candidate(\'' + row[0] + '\')\" class=\"icon_vox can_list cl_edit\"><span class=\"material-icons\" >edit<\/span><\/a>\r\n<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Delete\" class=\"icon_vox delete_candidate\" data-column=\"' + row[0] + '\" ><span class=\"material-icons\">delete<\/span><\/a>\r\n<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\"  data-column=\"' + row[0] + '\" title=\"View\"  class=\"icon_vox view_candidate\"><span class=\"material-icons\">pageview<\/span><\/a>\r\n' + schedule;
                                return links;
                            }
                        }
                    ]
                });
            }
        },
        ROUTINES: {
            register: function() {
                main.ROUTINES.getSelectedRow.apply();
            },
            getSelectedRow: function(obj) {
                return {
                    index: $(obj).closest('tr').index(),
                    data: globalVars.tableId.dataTable().fnGetData($(obj).closest('tr').index())
                }
            }
        },
        EVENTS: {
            register: function() {
                main.EVENTS.eventButtonRow.apply();
            },
            eventButtonRow: function() {
                globalVars.tableId
                    .on('preXhr.dt', function(e, setting, data) {
                        console.log(data);
                    })
                    .on('xhr.dt', function(e, setting, data) {})
                    .on('draw.dt', function() {
                        main.EVENTS.gridBtnTable.apply();
                    });

            },
            gridBtnTable: function() {
                var oBtn = $('button[data-tag="pilih"]');
                oBtn.unbind().bind('click', function() {
                    var that = $(this).attr('data-tag');
                    if (that == 'pilih') {
                        var data = main.ROUTINES.getSelectedRow($(this));
                        console.log(data); //GET POSITION ID DATA AND ALL DATA
                        console.log(data.data[1]); //SEPCIFIK DATA YOU CHICE
                    }
                });
            }
        }
    } //END MAIN
    var x = main.register.apply();

    $("#table_lay tfoot input").on('keyup', function() {
        var candidate_columnfo0 = $(".candidate_columnfo0").val();
        var candidate_columnfo1 = $(".candidate_columnfo1").val();
        var candidate_columnfo2 = $(".candidate_columnfo2").val();
        var candidate_columnfo3 = $(".candidate_columnfo3").val();
        globalVars.tableConfigs.column(0).search(candidate_columnfo0).column(1).search(candidate_columnfo1).column(2).search(candidate_columnfo2).column(3).search(candidate_columnfo3).draw();
    });
    $("#delete_modal").on("click", "#confirm_delete_candidates", function(e) {
        var action_page = $("#action_page").val();
        var action_id = $("#action_id").val();
        if (action_page == 'candidate_list') {
            candidate_list_delete(action_id);
        }
    });
    function candidate_list_delete(action_id) {
        $.ajax({
            url: domain + "cfc/database.cfc?method=delete_candidate",
            type: "POST",
            data: {
                action_id: parseInt(action_id)
            },
            success: function(html) {
                location.reload();
            }
        });
    }
    $("#table_lay").on("click", ".delete_candidate", function(e) {

        $("#action_id").val($(this).attr("data-column"));
        $("#action_page").val("candidate_list");
        $("#delete_modal").modal();
    });
    $("#table_lay").on("click", ".view_candidate", function(e) {
        var action_id = $(this).attr("data-column");
        $.ajax({
            url: domain + "cfc/database.cfc?method=view_candidate",
            type: "POST",
            data: {
                action_id: parseInt(action_id)
            },
            success: function(html) {
                $("#view_candidate_modal_div").html(html);
                $("#viewcandidate_modal").modal();
            }
        });

    });

});
$(".add_candidate_but").click(function() {
    $("#candidateadd_modal").modal();
});

function edit_candidate(id) {
    $.ajax({
        url: domain + "cfc/database.cfc?method=edit_candidate",
        type: "POST",
        data: {
            action_id: parseInt(id)
        },
        success: function(html) {
            $("#edit_candidate_modal").html(html);
            $("#candidateedit_modal").modal();
        }
    });
}
$("#edit_candidate_modal").on("submit", "#edit_candidate_form", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=UpdateCandidate_form",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
          alert("Edited Successfully");
          location.reload();
        }
    });
});
$(".responsive_tag").click(function() {
    $("#navigation-app").fadeOut("slow");
});
$(".responsive_bar").click(function() {
    $("#navigation-app").fadeIn("slow");
});
$("#cn_resume_skills").select2({
    placeholder: "Skills"
});
$(".form_dev").submit(function(e) {
    e.preventDefault();
    $.ajax({
        url: domain + "cfc/logindb.cfc?method=logindb",
        data: $(this).serialize(),
        type: "POST",
        success: function(html) {
            if ($.trim(html) == 'Success') {

                window.location.href = domain + "home.cfm";
            } else {
                $(".error_disp_loggs").html('invalid Login');
            }
        }
    });

});
$('[data-toggle="tooltip"]').tooltip();
function tabs_select(tabs_select) {
    $("div[id='schedultinter']").hide();

    $("div[class='table table_lay" + tabs_select + "']").css("display","block");
}
$('#skills_list').DataTable({
    "bProcessing": true,
    "bServerSide": true,
    "responsive": true,
    "sAjaxSource": domain + 'skill/cfc/skills_list.cfc?method=dataTable',
    "lengthMenu": [
        [5, 10, 25, 50],
        [5, 10, 25, 50]
    ],
    "rowReorder": {
        selector: 'td:nth-child(2)'
    },
    columns: [

        {
            title: 'Id',
            name: "PanelId",
            class: "panel_list_column"
        },
        {
            title: 'Name',
            name: "Name",
            class: "panel_list_column"
        },
        {
            title: "Action",
            orderable: false,
            data: null,
            class: "dt-head-center",
            'render': function(data, type, row) {

                return '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Edit\"  onclick=\"return edit_skills(\'' + row[0] + '\')\" class=\"icon_vox can_list cl_edit\"><span class=\"material-icons\" >edit<\/span><\/a>\r\n<a href=\"#\" data-toggle=\"tooltip\" onclick=\"return delete_skills(\'' + row[0] + '\')\"  data-placement=\"bottom\" title=\"Delete\" class=\"icon_vox delete_candidate\" data-column=\"' + row[0] + '\" ><span class=\"material-icons\">delete<\/span><\/a>'
            }
        }
    ]
});
$(".add_skills_but").click(function() {
    $("#skilladd_modal").modal();
});
$(".add_skills_form_div").on("submit", "#add_skills_form", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=insertskills",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            if (result == "success") {
                $(".modal-content").html("<center><div class='msg_header'><h3>Insert Successfully!!!</h3></div></center>");
                setTimeout(function() {
                    location.reload();
                }, 3000);
            }
        }
    });

});
function delete_skills(id) {
    $("#delete_modal_skills").modal();
    $("#action_id").val(id);
    $("#action_page").val("delete_skills");
}
$("#confirm_delete_skills").click(function() {
    var action_id = $("#action_id").val();
    $.ajax({
        url: domain + "cfc/database.cfc?method=delete_skills",
        type: "POST",
        data: {
            action_id: parseInt(action_id)
        },
        success: function(html) {
            alert("success");
            location.reload();
        }
    });
});
function edit_skills(id) {
    $.ajax({
        url: domain + "cfc/database.cfc?method=edit_skills",
        type: "POST",
        data: {
            action_id: parseInt(id)
        },
        success: function(html) {
            $(".edit_skills_form_div").html(html);
            $("#skillsedit_modal").modal();
        }
    });
}
$(".edit_skills_form_div").on("submit", "#edit_skills_form", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=editskills_save",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            if (result == "success") {
                $(".modal-content").html("<center><div class='msg_header'><h3>Edited Successfully!!!</h3></div></center>");
                setTimeout(function() {
                    location.reload();
                }, 3000);
            }
        }
    });
});
$('#interview_types_list').DataTable({
    "bProcessing": true,
    "bServerSide": true,
    "responsive": true,
    "sAjaxSource": domain + 'interviewtypes/cfc/interviewtypes_list.cfc?method=dataTable',
    "lengthMenu": [
        [5, 10, 25, 50],
        [5, 10, 25, 50]
    ],
    "rowReorder": {
        selector: 'td:nth-child(2)'
    },
    columns: [

        {
            title: 'Id',
            name: "PanelId",
            class: "panel_list_column"
        },
        {
            title: 'Name',
            name: "Name",
            class: "panel_list_column"
        },
        {
            title: "Action",
            orderable: false,
            data: null,
            class: "dt-head-center",
            'render': function(data, type, row) {

                return '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Edit\"  onclick=\"return edit_interview_types(\'' + row[0] + '\')\" class=\"icon_vox can_list cl_edit\"><span class=\"material-icons\" >edit<\/span><\/a>\r\n<a href=\"#\" data-toggle=\"tooltip\" onclick=\"return delete_interview_types(\'' + row[0] + '\')\"  data-placement=\"bottom\" title=\"Delete\" class=\"icon_vox delete_candidate\" data-column=\"' + row[0] + '\" ><span class=\"material-icons\">delete<\/span><\/a>'
            }
        }
    ]
});
$(".add_interviewtypes_form_div").on("submit", "#add_interviewtypes_form", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=insertinterviewtypes",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            if (result == "success") {
                $(".modal-content").html("<center><div class='msg_header'><h3>Insert Successfully!!!</h3></div></center>");
                setTimeout(function() {
                    location.reload();
                }, 3000);
            }
        }
    });

});
$(".add_interview_types_but").click(function() {
    $("#interviewtypesadd_modal").modal();
});
function delete_interview_types(id) {
    $("#delete_modal_interviewtypes").modal();
    $("#action_id").val(id);
    $("#action_page").val("delete_interviewtypes");
}
$("#confirm_delete_interviewtypes").click(function() {
    var action_id = $("#action_id").val();
    $.ajax({
        url: domain + "cfc/database.cfc?method=delete_interviewtypes",
        type: "POST",
        data: {
            action_id: parseInt(action_id)
        },
        success: function(html) {
            alert("success");
            location.reload();
        }
    });
});
function edit_interview_types(id) {
    $.ajax({
        url: domain + "cfc/database.cfc?method=edit_interviewtypes",
        type: "POST",
        data: {
            action_id: parseInt(id)
        },
        success: function(html) {
            $(".edit_interviewtypes_form_div").html(html);
            $("#interviewtypesedit_modal").modal();
        }
    });
}
$(".edit_interviewtypes_form_div").on("submit", "#edit_interviewtypes_form", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=editinterviewtypes_save",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(result) {
            result = $.trim(result);
            if (result == "success") {
                $(".modal-content").html("<center><div class='msg_header'><h3>Edited Successfully!!!</h3></div></center>");
                setTimeout(function() {
                    location.reload();
                }, 3000);
            }
        }
    });
});