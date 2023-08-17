import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static values = { title: String ,x: Array, y: Array }
    static targets = ["canvas"]
    connect() {
        var ctx = this.canvasTarget.getContext("2d");
        new Chart(ctx, {
            type: "bar",
            data: {
                labels: this.xs,
                datasets: [{
                    label: this.title,
                    data: this.ys,
                    backgroundColor: [
                        "rgba(255, 99, 132, 0.2)",
                        "rgba(54, 162, 235, 0.2)",
                        "rgba(255, 206, 86, 0.2)",
                        "rgba(75, 192, 192, 0.2)",
                        "rgba(153, 102, 255, 0.2)",
                        "rgba(255, 159, 64, 0.2)"
                    ],
                    borderColor: [
                        "rgba(255, 99, 132, 1)",
                        "rgba(54, 162, 235, 1)",
                        "rgba(255, 206, 86, 1)",
                        "rgba(75, 192, 192, 1)",
                        "rgba(153, 102, 255, 1)",
                        "rgba(255, 159, 64, 1)"
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

    get title() {
        return this.titleValue || JSON.parse(this.canvasTarget.dataset.dashboardTitleValue)
    }

    get ys() {
        return this.yValue || JSON.parse(this.canvasTarget.dataset.dashboardYValue)
    }

    get xs() {
        return this.xValue || JSON.parse(this.canvasTarget.dataset.dashboardXValue)
    }
}
