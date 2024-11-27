import React, { useEffect, useState } from 'react';
import { Button, Spinner } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import { toast, ToastContainer } from 'react-toastify';
import axios from 'axios';
import Footer from '../Footer';
import HeaderAdmin from '../HeaderAdmin';
import SiderbarAdmin from '../SidebarAdmin';
import { nanoid } from 'nanoid';
import ModalTenFooterAdmin from '../modla/ModalTenFooterAdmin';


const TenFooterAdmin = () => {
    const [tenFooters, setTenFooters] = useState([]);
    const [dangtai, setDangtai] = useState(false);
    const [trangHienTai, setTrangHienTai] = useState(1);
    const tenFooterMoiTrang = 4;

    // Logic tìm kiếm
    const [timKiem, setTimKiem] = useState('');
    const tenFootersDaLoc = tenFooters.filter((tf) =>
        tf.tieude.toLowerCase().includes(timKiem.toLowerCase())
    );

    // Logic phân trang
    const viTriCuoi = trangHienTai * tenFooterMoiTrang;
    const viTriDau = viTriCuoi - tenFooterMoiTrang;
    const tenFootersTheoTrang = tenFootersDaLoc.slice(viTriDau, viTriCuoi);
    const tongSoTrang = Math.ceil(tenFootersDaLoc.length / tenFooterMoiTrang);

    const phanTrang = (soTrang) => setTrangHienTai(soTrang);

    const [hienThiModal, setHienThiModal] = useState(false);
    const [chinhSua, setChinhSua] = useState(false);
    const [tenFooterHienTai, setTenFooterHienTai] = useState(null);

    useEffect(() => {
        layDanhSachTenFooters();
    }, []);

    const layDanhSachTenFooters = async () => {
        setDangtai(true);
        try {
            const response = await axios.get(`${process.env.REACT_APP_BASEURL}/api/TenFooter`);
            setTenFooters(response.data);
        } catch (error) {
            console.error('Lỗi khi lấy danh sách footer:', error);
            toast.error('Có lỗi khi lấy danh sách footer!', {
                position: 'top-right',
                autoClose: 3000,
            });
        } finally {
            setDangtai(false);
        }
    };

    const moModalThemTenFooter = () => {
        setChinhSua(false);
        setTenFooterHienTai(null);
        setHienThiModal(true);
    };

    const moModalSuaTenFooter = (tf) => {
        setChinhSua(true);
        setTenFooterHienTai(tf);
        setHienThiModal(true);
    };

    const xoaTenFooter = async (id, tieude) => {
        const token = localStorage.getItem('adminToken');
        try {
            await axios.delete(`${process.env.REACT_APP_BASEURL}/api/TenFooter/${id}`, {
                headers: {
                    Authorization: `Bearer ${token}`,
                },
            });
            toast.success(`Xóa footer "${tieude}" thành công!`, {
                position: 'top-right',
                autoClose: 3000,
            });
            layDanhSachTenFooters();
            setTrangHienTai(1);
        } catch (error) {
            console.error('Lỗi khi xóa footer:', error);
            toast.error('Không thể xóa footer!', {
                position: 'top-right',
                autoClose: 3000,
            });
        }
    };

    return (
        <div id="wrapper">
            <SiderbarAdmin />

            <div id="content-wrapper" className="d-flex flex-column">
                <div id="content">
                    <HeaderAdmin />

                    <div className="content-header">
                        <div className="container-fluid">
                            <div className="row mb-2">
                                <div className="col-sm-6">
                                    <h1 className="h3 mb-0 text-gray-800">Danh sách Footer</h1>
                                </div>
                                <div className="col-sm-6">
                                    <ol className="breadcrumb float-sm-right">
                                        <li className="breadcrumb-item">
                                            <Link to="/admin/trangchu">Home</Link>
                                        </li>
                                        <li className="breadcrumb-item active">Danh sách Footer</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="container-fluid mb-3">
                        <div className="row">
                            <div className="col-12 col-md-6 col-lg-4 mb-3">
                                <label htmlFor="searchFooter" className="form-label">
                                    Tìm kiếm Footer:
                                </label>
                                <input
                                    id="searchFooter"
                                    type="text"
                                    className="form-control"
                                    placeholder="Nhập tiêu đề footer..."
                                    value={timKiem}
                                    onChange={(e) => setTimKiem(e.target.value)}
                                />
                            </div>
                        </div>
                    </div>

                    <div className="container-fluid">
                        <div className="card shadow mb-4">
                            <div className="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 className="m-0 font-weight-bold text-primary">Danh sách Footer</h6>
                                <Button variant="primary" onClick={moModalThemTenFooter}>
                                    <i className="fas fa-plus-circle"></i> Thêm Footer
                                </Button>
                            </div>
                            <div className="card-body table-responsive p-0" style={{ maxHeight: '400px' }}>
                                {dangtai ? (
                                    <div className="text-center">
                                        <Spinner animation="border" variant="primary" />
                                        <p>Đang tải dữ liệu...</p>
                                    </div>
                                ) : (
                                    <table className="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Tiêu đề</th>
                                                <th>Phụ đề</th>
                                                <th>Hình ảnh</th>
                                                <th>Link</th>
                                                <th>Chức năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {tenFootersTheoTrang.map((tf, index) => (
                                                <tr key={nanoid()}>
                                                    <td>{viTriDau + index + 1}</td>
                                                    <td>{tf.tieude}</td>
                                                    <td>{tf.phude}</td>
                                                    <td>
                                                        {tf.footerIMG?.length > 0 ? (
                                                            <img
                                                                src={`${process.env.REACT_APP_BASEURL}/${tf.footerIMG[0].imagePath}`}
                                                                alt="Footer"
                                                                style={{ width: '100px', height: '50px', objectFit: 'cover' }}
                                                            />
                                                        ) : (
                                                            'Không có hình ảnh'
                                                        )}
                                                    </td>
                                                    <td>
                                                        {tf.footerIMG?.length > 0 ? (
                                                            tf.footerIMG.map((img) => (
                                                                <div key={img.id}>
                                                                    <a href={img.link} target="_blank" rel="noopener noreferrer">
                                                                        {img.link}
                                                                    </a>
                                                                </div>
                                                            ))
                                                        ) : (
                                                            'Không có link'
                                                        )}
                                                    </td>

                                                    <td>
                                                        <Button
                                                            variant="primary me-2"
                                                            onClick={() => moModalSuaTenFooter(tf)}
                                                        >
                                                            <i className="fas fa-edit"></i>
                                                        </Button>
                                                        <Button
                                                            variant="danger"
                                                            onClick={() => xoaTenFooter(tf.id, tf.tieude)}
                                                        >
                                                            <i className="fas fa-trash"></i>
                                                        </Button>
                                                    </td>
                                                </tr>
                                            ))}
                                        </tbody>
                                    </table>
                                )}
                            </div>

                            <div className="card-footer clearfix">
                                <ul className="pagination pagination-sm m-0 float-right">
                                    <li className={`page-item ${trangHienTai === 1 ? 'disabled' : ''}`}>
                                        <button className="page-link" onClick={() => phanTrang(trangHienTai - 1)}>
                                            «
                                        </button>
                                    </li>
                                    {[...Array(tongSoTrang)].map((_, i) => (
                                        <li key={i + 1} className={`page-item ${trangHienTai === i + 1 ? 'active' : ''}`}>
                                            <button className="page-link" onClick={() => phanTrang(i + 1)}>
                                                {i + 1}
                                            </button>
                                        </li>
                                    ))}
                                    <li className={`page-item ${trangHienTai === tongSoTrang ? 'disabled' : ''}`}>
                                        <button className="page-link" onClick={() => phanTrang(trangHienTai + 1)}>
                                            »
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <Footer />
            </div>

            <ModalTenFooterAdmin
                show={hienThiModal}
                handleClose={() => setHienThiModal(false)}
                isEdit={chinhSua}
                tenFooter={tenFooterHienTai}
                fetchTenFooters={layDanhSachTenFooters}
            />

            <ToastContainer />
        </div>
    );
};

export default TenFooterAdmin;
