import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Bar } from 'react-chartjs-2';
import { Chart, CategoryScale, LinearScale, BarController, BarElement } from 'chart.js';
Chart.unregister(BarController, BarElement);
Chart.register(CategoryScale, LinearScale, BarController, BarElement);

function RevenueLayout(){
    const [category, setCategory] = useState([]);
    const [selectedValue, setSelectedValue] = useState('');
    const [label, setLabel] = useState([]);
    const [values, setValues] = useState([]);
    
    useEffect(() => {
        const apiUrl = 'http://localhost:5000/get_category';  // Update with your Flask API endpoint
        axios.get(apiUrl)
          .then(response => {
            setCategory(response.data.category);
            
          })
          .catch(error => {
            console.error('Error fetching data:', error);
          });
      }, []);

      const handleSelectChange = (event) => {
        const newValue = event.target.value;
        setSelectedValue(newValue);

    };
    const handleSubmit = async () => {
        try {
            const response = await axios.post('http://localhost:5000/get_revenue', {
                category_id: selectedValue,
            }, {
                headers: {
                    'Content-Type': 'application/json',
                },
            });

            // Xử lý kết quả từ Flask, có thể làm gì đó với response.data
            setLabel(response.data.labels);
            setValues(response.data.values);
        } catch (error) {
            console.error('Error submitting data:', error);
        }
    };
    
    const chartOptions = {
        plugins: {
            datalabels: {
                anchor: 'end',
                align: 'end',
                color: 'black',
                formatter: (value, context) => {
                    const label = 'Doanh thu: ' + context.dataset.data[context.dataIndex].revenue +
                                  ' - Số lượng: ' + context.dataset.quantity[context.dataIndex];
                    // Custom display of values on the bar (optional)
                    return label;
                },
            },
        },
    };
    const formattedLabels = label.map(month => `Tháng ${month.month}`);
    const chartData = {
        labels: formattedLabels,
        datasets: [
          {
            label: 'Revenue',
            backgroundColor: 'rgba(75,192,192,0.2)', // Set your desired background color
            borderColor: 'rgba(75,192,192,1)', // Set your desired border color
            borderWidth: 1,
            hoverBackgroundColor: 'rgba(75,192,192,0.4)', // Set your desired hover background color
            hoverBorderColor: 'rgba(75,192,192,1)', // Set your desired hover border color
            data: values.map(item => (item.revenue)), // Use the 'values' state variable
            quantity: values.map(item => (item.quantity)),
          },
        ],
      };

    return(
        <div>
            <a href='/'>Home</a>
            <br/>
            <select onChange={handleSelectChange}>
                <option value=''>Loại sách</option>
                {category.map(categories => (
                    <option key={categories.id} value={categories.id}>{categories.name}</option>
                ))}
            </select>
            <div><button onClick={handleSubmit}>Search</button></div>
            <div>
                <Bar data={chartData} options={chartOptions}/>
            </div>
            
        </div>
    )
}export default RevenueLayout