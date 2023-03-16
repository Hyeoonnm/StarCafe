window.addEventListener("load", () => {
    getPage(1);

    document.getElementById("search").addEventListener("click", e => {
        const search = document.querySelector("select[name = 'search']").value;
        const keyword = document.querySelector("input[name = 'keyword']").value;
        const minPrice = document.querySelector("input[name = 'minPrice']").value;
        const maxPrice = document.querySelector("input[name = 'maxPrice']").value;
        const category = document.querySelector("select[name = 'category']").value;
        const status = document.querySelector("select[name = 'status']").value;

        if (search == 1 || search == 2) {
            getPage(1, {search, keyword});
        } else if (search == 3) {
            getPage(1, {search, minPrice, maxPrice})
        } else if (search == 4) {
            getPage(1, {search, keyword: category})
        } else if (search == 5) {
            getPage(1, {search, keyword: status});
        }
    });
});

function getPage(page, query) {
    let url = `/api/product?page=${page}`;

    if (query) {
        url += "&" + new URLSearchParams(query).toString();
    }
    console.log(url);

    fetch(url)
        .then(resp => resp.json())
        .then(result => {
            if (result.list.length) {
                document.querySelector("#empty_list").classList.add("hide");
            } else {
                document.querySelector("#empty_list").classList.remove("hide");
            }

            document.querySelector(".pagination .page-next").onclick = ("click", e => getPage(result.pager.next, query));
            document.querySelector(".pagination .page-prev").onclick = ("click", e => getPage(result.pager.prev, query));
            document.querySelector(".pagination .page-last").onclick = ("click", e => getPage(result.pager.last, query));
            document.querySelector(".pagination .page-first").onclick = ("click", e => getPage(1, query));

            const pageNext = document.querySelector(".page-next");
            // const pagination = document.querySelector(".pagination .page-next");

            document.querySelectorAll(".pagination .page-list").forEach(element => element.remove());

            result.pager.list.forEach(element => {

                const li = document.createElement("li");
                li.classList.add("page-item", "page-list");

                const link = document.createElement("button");
                link.classList.add("page-link");
                link.textContent = element;

                if (element == result.pager.page)
                    link.classList.add("active");

                link.addEventListener("click", e => getPage(element, query));

                li.append(link);

                pageNext.before(li);
                // pagination.before(li);
            });

            const tbody = document.querySelector("#list");

            tbody.querySelectorAll(".item").forEach(element => {
                element.remove();
            });

            result.list.forEach(element => {

                console.log(element);

                const tr = document.createElement("tr");
                tr.classList.add("item")

                const id = document.createElement("td");
                id.textContent = element.productId;
                tr.append(id);

                const name = document.createElement("td");
                name.textContent = element.name;
                tr.append(name);

                const price = document.createElement("td");
                price.textContent = element.price;
                tr.append(price);

                const category = document.createElement("td");
                category.textContent = element.category__;
                tr.append(category);

                const status = document.createElement("td");
                status.textContent = element.status__;
                tr.append(status);

                const manage = document.createElement("td");

                const update_button = document.createElement("a")
                update_button.textContent = "변경";
                manage.append(update_button);
                update_button.href = "/product/update/" + element.productId;
                update_button.classList.add("btn", "btn-sm", "btn-primary");


                const delete_button = document.createElement("a");
                delete_button.textContent = "삭제";
                manage.append(delete_button);
                delete_button.href = "/product/delete/" + element.productId;
                delete_button.classList.add("btn", "btn-sm", "btn-danger");
                delete_button.style.marginLeft = "0.3em";

                tr.append(manage);
                tbody.append(tr);

            })
        });
}