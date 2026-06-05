import streamlit as st

st.title("Data Role Suggestion App")

skills = st.text_input("Enter skills separated by comma")

if st.button("Suggest Role"):

    skills = skills.lower()

    roles = []

    if "python" in skills and "sql" in skills and "excel" in skills:
        roles.append("Data Analyst")

    if "sql" in skills and "power bi" in skills:
        roles.append("BI Analyst")

    if "excel" in skills and "sql" in skills:
        roles.append("Reporting Analyst")

    if "communication" in skills and "excel" in skills:
        roles.append("Business Analyst")

    if "python" in skills and "machine learning" in skills:
        roles.append("Data Scientist")

    if len(roles) > 0:
        st.success("Recommended Roles")
        for role in roles:
            st.write("Role", role)
    else:
        st.warning("No matching role found")