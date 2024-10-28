import { useState } from "react";
import "../Profile/EmployerCreateProfile.scss";

function UpdateEmployerProfile() {
    const [companyName, setCompanyName] = useState('');
    const [aboutCompany, setAboutCompany] = useState('');
    const [companyLogo, setCompanyLogo] = useState(null);
    const [preferentialTreatment, setPreferentialTreatment] = useState('');
    const [companyBenefits, setCompanyBenefits] = useState([]);
    const [inputBenefit, setInputBenefit] = useState('');
    const [email, setEmail] = useState('');

    const handleBenefitChange = (e) => setInputBenefit(e.target.value);

    const handleAddBenefit = (e) => {
        e.preventDefault();
        if (inputBenefit && !companyBenefits.includes(inputBenefit)) {
            setCompanyBenefits([...companyBenefits, inputBenefit]);
            setInputBenefit('');
        }
    };

    const handleDeleteBenefit = (benefitToDelete) => {
        const updatedBenefits = companyBenefits.filter(benefit => benefit !== benefitToDelete);
        setCompanyBenefits(updatedBenefits);
    };

    const handleLogoChange = (e) => {
        const file = e.target.files[0];
        if (file) setCompanyLogo(file);
    };

    const convertImageToBase64 = (file) => {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = () => resolve(reader.result);
            reader.onerror = (error) => reject(error);
        });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        let company_logo = null;
        if (companyLogo) {
            company_logo = await convertImageToBase64(companyLogo);
        }

        const profileData = {
            company_name: companyName,
            about_company: aboutCompany,
            company_logo,
            preferential_treatment: preferentialTreatment,
            company_benefits: JSON.stringify(companyBenefits),
            email
        };

        console.log("Submitting profile data:", profileData);

        try {
            const token = localStorage.getItem('token');
            if (!token) {
                alert('No token found');
                return;
            }

            const response = await fetch('http://localhost:5000/api/update_employer_profile', {
                method: 'PUT',
                headers: {
                    'Authorization': `Bearer ${token}`,
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(profileData),
            });

            const data = await response.json();

            if (response.ok) {
                alert("Profile Updated!");
            } else {
                alert(`An error occurred: ${data.message}`);
            }
        } catch (error) {
            console.error('Error creating profile:', error);
            alert('An error occurred while updating your profile.');
        }
    };

    return (
        <div>
            <div id="particles-js" style={{ position: 'absolute', width: '100%', height: '100%', zIndex: -1 }}></div>

            <div className="create-profile-page">
                <form onSubmit={handleSubmit}>
                    <h1>Update Employer Profile</h1>

                    <label htmlFor="company-logo">Company Logo:</label>
                    <input type="file" accept="image/jpeg, image/png" id="company-logo" onChange={handleLogoChange} />
                    {companyLogo && (
                        <div className="image-preview">
                            <img src={URL.createObjectURL(companyLogo)} alt="Logo Preview" style={{ width: '100px', height: '80px' }} />
                        </div>
                    )}

                    <label htmlFor="company-name">Company Name:</label>
                    <input
                        type="text"
                        id="company-name"
                        placeholder="Company Name"
                        value={companyName}
                        onChange={(e) => setCompanyName(e.target.value)}
                    />

                    <label htmlFor="email">Email:</label>
                    <input
                        type="email"
                        id="email"
                        placeholder="Company Email"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                    />

                    <label htmlFor="about-company">About Company:</label>
                    <textarea
                        id="about-company"
                        placeholder="Describe your company"
                        value={aboutCompany}
                        onChange={(e) => setAboutCompany(e.target.value)}
                    />

                    <label htmlFor="preferential-treatment">Preferential Treatment:</label>
                    <input
                        type="text"
                        id="preferential-treatment"
                        placeholder="Any preferential treatment for employees?"
                        value={preferentialTreatment}
                        onChange={(e) => setPreferentialTreatment(e.target.value)}
                    />

                    <label htmlFor="company-benefits">Company Benefits (Add at least 1):</label>
                    <div className="benefits-input">
                        <input
                            type="text"
                            id="company-benefits"
                            value={inputBenefit}
                            onChange={handleBenefitChange}
                            placeholder="Enter a benefit and press add"
                        />
                        <button type="button" className="add-benefit-button" onClick={handleAddBenefit}>Add Benefit</button>
                    </div>
                    <div className="benefits-list">
                        {companyBenefits.map((benefit, index) => (
                            <span key={index} className="benefit-item">
                                {benefit}
                                <button className="delete-benefit" onClick={() => handleDeleteBenefit(benefit)}>
                                    &times;
                                </button>
                            </span>
                        ))}
                    </div>

                    <button type="submit" className="submit-btn">Update</button>
                </form>
            </div>
        </div>
    );
}

export default UpdateEmployerProfile;