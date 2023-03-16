window.addEventListener("load", () => {

    document.querySelectorAll(".keyword-all").forEach(item => {
        item.disabled = true;
    });

    document.querySelector("select[name='search']").addEventListener("change", evt => {
        // console.dir(evt.target);
        // const item = evt.target[evt.target.selectedIndex].text;
        // console.log(item);

        // const value = evt.target.value;

        document.querySelectorAll(".keyword-" + value).forEach(item => {
            item.disabled = false;
        });
    });
});