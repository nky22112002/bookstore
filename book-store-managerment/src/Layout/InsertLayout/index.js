import styles from '../InsertLayout/InsertLayout.module.scss'
import axios from 'axios'
import React, { useEffect, useState } from 'react';
import classNames from 'classnames/bind'

const cx = classNames.bind(styles)
function InsertLayout() {
    const [date, setDate] = useState('');
    const [rows, setRows] = useState([]);
    const [index, setIndex] = useState(1);
    const [category, setCategory] = useState([]);

    const [selectedItem, setSelectedItem] = useState(category[0]);

    useEffect(() => {
        const apiUrl = 'http://localhost:5000/invoice';  // Update with your Flask API endpoint
        axios.get(apiUrl)
          .then(response => {
            setCategory(response.data.category);
          })
          .catch(error => {
            console.error('Error fetching data:', error);
          });
      }, []);

    useEffect(() => {
        axios.get('http://localhost:5000/insert-book')
        .then(response => {
        setDate(response.data.date);
        })
        .catch(error => {
        console.error('Error fetching date:', error);
        });    
    }, []);

    const handleInsertRow = () => {
        const newRow = {
          index,
          name: '',
          category: '',
          author: '',
          quantity: ''
        };
        setRows(prevRows => [...prevRows, newRow]);
        setIndex(index + 1);
      };
    
      const handleInputChange = (rowIndex, fieldName, value) => {
        setRows(prevRows =>
          prevRows.map(row =>
            row.index === rowIndex ? { ...row, [fieldName]: value } : row
          )
        );
      };
    
      const handleSubmit = async () => {
        try {
            const response = await axios.post('http://localhost:5000/submit-books', { data: rows });

        // Handle the response from the server if needed
            window.alert('Data inserted successfully!');

            window.location.reload();

        } catch (error) {
            console.error('Error submitting data:', error);
        }
    };
    const handleBlur = (rowIndex) => {
        const row = rows.find((r) => r.index === rowIndex);

        if (!row) {
            console.error('Row not found for index:', rowIndex);
            return;
          }
        
          const quantityValue = row.quantity;
        
          if (quantityValue < 150 || quantityValue > 300) {
            alert(`Error: Quantity must be between 150 and 300 for row with index ${rowIndex}. Skipping this row.`);
          }
      };
      const handleSelectChangeCategory = (event, rowIndex) => {
        const selectedCategory = category.find(categorries => categorries.id === parseInt(event.target.value, 10));
        console.log(selectedCategory);
        setRows(prevRows => {
            const updatedRows = [...prevRows];
            updatedRows[rowIndex] = {
              ...updatedRows[rowIndex],
              selectedCategory: selectedCategory,
              category: selectedCategory ? selectedCategory.id : '', // Add this line to update the name

            };
            return updatedRows;
          });
        setSelectedItem(selectedCategory);
      };
    return(
        <div className={cx('container')}>
            <a href='/'>Home</a>
            <form method='post'>
                <table className={cx('table-outer')}>
                    <thead>
                        <tr>
                            <td className={cx('title')} colSpan="5">Phiếu nhập sách</td>
                        </tr>
                        <tr>
                            <td className={cx('title')} colSpan="5">
                                <p>Ngày nhập:</p>
                                <label>{date}</label>
                            </td>
                            
                        </tr>
                        <tr>
                            <th>STT</th>
                            <th>Sách</th>
                            <th>Thể loại</th>
                            <th>Tác giả</th>
                            <th>Số lượng</th>
                        </tr>
                    </thead>
                    <tbody>
                        {rows.map((row, index) => (
                            <tr key={row.index}>
                                <td>{row.index}</td>
                                <td>
                                    <label>
                                        <input type="text" 
                                        name={`name-${row.index}`} 
                                        value={row.name} 
                                        onChange={(e) => handleInputChange(row.index, 'name', e.target.value)}/>
                                    </label>
                                </td>
                                <td>
                                    <label>
                                    <select
                                            id={`dropdown-${index}`}
                                            value={row.selectedCategory ? row.selectedCategory.id : ''}
                                            onChange={(e) => handleSelectChangeCategory(e, index)}>
                                            <option value="" disabled>Select a book</option>
                                            {category.map(categorries => (
                                              <option key={categorries.id} value={categorries.id}>{categorries.name}</option>
                                            ))}
                                        </select>
                                    </label>
                                </td>
                                <td>
                                    <label>
                                        <input type="text" 
                                        name={`author-${row.index}`} 
                                        value={row.author} 
                                        onChange={(e) => handleInputChange(row.index, 'author', e.target.value)}/>
                                    </label>
                                </td>
                                <td>
                                    <label>
                                        <input type="text" 
                                        name={`quantity-${row.index}`} 
                                        value={row.quantity} 
                                        onChange={(e) => handleInputChange(row.index, 'quantity', e.target.value)} 
                                        onBlur={() => handleBlur(row.index)}/>
                                    </label>
                                </td>
                            </tr>
                        ))}
                        
                        
                    </tbody>
                    <tfoot>
                        <tr>
                            <td><button type="button" onClick={handleInsertRow}>Insert row</button></td>
                            <td><button type='button' onClick={handleSubmit}>Insert</button></td>
                        </tr>
                    </tfoot>
                </table>
            </form>
        </div>
    );
}
export default InsertLayout;