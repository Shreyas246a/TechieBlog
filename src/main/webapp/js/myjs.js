function doLike(pid,userid,liked){
    
    const d={
        userid:userid,
        pid:pid,
        operation:(liked)?"dislike":"like"
    }
    console.log(liked);
    $.ajax({
        url: "LikeServlet",
        data:d,
        success: function (data, textStatus, jqXHR) {
            console.log(data)
            if(data.trim() == 'liked'){
                let c = $(".like-counter").html();
                c++;
                $(".like-counter").html(c);
                $(".like-btn").addClass("bg-primary")
                window.location.reload();
            }
             if(data.trim() == 'disliked'){
                let c = $(".like-counter").html();
                c--;
                if(c<0){
                    c=0;
                }
                $(".like-counter").html(c);
                $(".like-btn").removeClass("bg-primary")
                window.location.reload();
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    })
    
}