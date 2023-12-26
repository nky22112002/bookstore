import classNames from 'classnames/bind'
import axios from 'axios'
import React, { useEffect, useState } from 'react';
import styles from '../InvoiceLayout/InvoiceLayout.module.scss'

const cx = classNames.bind(styles)
function InvoiceLayout(){
    const [date, setDate] = useState('');
    const [rows, setRows] = useState([]);
    const [index, setIndex] = useState(1);
    const [books, setBooks] = useState([]);
    const [selectedItem, setSelectedItem] = useState(books[0]); // or any default book object
    const [employeeName, setEmployeeName] = useState('');
    const [customerName, setCustomerName] = useState('');

    useEffect(() => {
        const apiUrl = 'http://localhost:5000/invoice';  // Update with your Flask API endpoint
        axios.get(apiUrl)
          .then(response => {
            setBooks(response.data.books);
            console.log(books);
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
          quantity: '',
          price: ''
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
        setSelectedItem(prevSelectedBooks => ({ ...prevSelectedBooks, [rowIndex]: value }));

      };
      const handleInputEmployee = event => {
        setEmployeeName(event.target.value);

      }
      const handleInputCustomer = event => {
        setCustomerName(event.target.value);

      }
    
      const handleSubmit = async () => {
        try {
            const response = await axios.post('http://localhost:5000/submit-invoice', { 
                data: rows,
                employeeName: employeeName,
                customerName: customerName 
             });

            window.alert('Data inserted successfully!');

            window.location.reload();

        } catch (error) {
            console.error('Error submitting data:', error);
        }
    };
    const handleSelectChange = (event, rowIndex) => {
        const selectedBook = books.find(book => book.id === parseInt(event.target.value, 10));
        setRows(prevRows => {
            const updatedRows = [...prevRows];
            updatedRows[rowIndex] = {
              ...updatedRows[rowIndex],
              selectedBook: selectedBook,
              name: selectedBook ? selectedBook.id : '', // Add this line to update the name

            };
            return updatedRows;
          });
        setSelectedItem(selectedBook);
      };
    return(
        <div className={cx('container')}>
            <a href='/'>Home</a>
            <form method='post'>
                <table className={cx('table-outer')}>
                    <thead>
                        <tr>
                            <td className={cx('title')} colSpan="5">Hóa đơn bán sách</td>
                        </tr>
                        <tr className={cx('second-row')}>
                            <td className={cx('invoice-inf')} colSpan="3">
                                <p>Họ tên khách hàng:
                                    <input type='text'
                                    value={customerName}
                                    onChange={handleInputCustomer}
                                    /> 
                                </p>
                            </td>
                            <td className={cx('invoice-inf')} colSpan="2">
                                <p>Ngày lập hóa đơn:<label>{date}</label></p>
                                
                            </td>
                        </tr>
                        <tr>
                            <th>STT</th>
                            <th>Sách</th>
                            <th>Thể loại</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                        </tr>
                    </thead>
                    <tbody>
                        {rows && rows.map((row, index) => (
                            <tr key={row.index}>
                                <td>{row.index}</td>
                                <td>
                                    <label>
                                        <select
                                            id={`dropdown-${index}`}
                                            value={row.selectedBook ? row.selectedBook.id : ''}
                                            onChange={(e) => handleSelectChange(e, index)}>
                                            <option value="" disabled>Select a book</option>
                                            {books.map(book => (
                                              <option key={book.id} value={book.id}>{book.name}</option>
                                            ))}
                                        </select>
                                    </label>
                                </td>
                                <td>
                                    <label>
                                        <input type="text" 
                                        name={`category-${row.index}`} 
                                        value={row.category} 
                                        onChange={(e) => handleInputChange(row.index, 'category', e.target.value)}/>
                                    </label>
                                </td>
                                <td>
                                    <label>
                                        <input type="text" 
                                        name={`quantity-${row.index}`} 
                                        value={row.quantity} 
                                        onChange={(e) => handleInputChange(row.index, 'quantity', e.target.value)}/>
                                    </label>
                                </td>
                                <td>
                                    <label>
                                        <input type="text" 
                                        name={`price-${row.index}`} 
                                        value={row.price} 
                                        onChange={(e) => handleInputChange(row.index, 'price', e.target.value)} 
                                        />
                                    </label>
                                </td>
                            </tr>
                        ))}
                        
                        
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colSpan='5'>Nhân viên thanh toán: 
                                <input className={cx('input-emp')} 
                                type='text'
                                value={employeeName}
                                onChange={handleInputEmployee}
                                /> 
                            </td>
                        </tr>
                        <tr>
                            <td colSpan='2'><button type="button" onClick={handleInsertRow}>Insert row</button></td>
                            <td colSpan='2'><button type='button' onClick={handleSubmit}>Insert</button></td>
                        </tr>
                    </tfoot>
                </table>
            </form>
        </div>
    );
}export default InvoiceLayout;