package edu.wayne.cs.raptor;

import java.util.Calendar;
import java.util.List;

import javax.swing.JOptionPane;

import org.hibernate.Session;

/**
 * This unadulterated, no-holds-barred titan of a class takes care of saving and retrieval for 
 * patient, vitals, encounter, and pharmacy encounters.  like a boss. 
 * @author Jackson Turner
 *
 */

public class EncounterService implements IEncounterService {

	private Session userSession;
	private LoginBean login;
	private Calendar calendar;
	
	private Patient patient;
	private Vitals vitals;
	private Encounter encounter;
	private PharmacyEncounter pharmEncounter;
	
	public EncounterService() {
		calendar = Calendar.getInstance();
	}
	
	public void saveOrUpdateEncounter()
	{
		
	}
	
	public String updateEncounter()
	{
		//housekeeping
		patient.setModifyingUser(login.getSystemUser().getUsername());
		patient.setLastModifiedDate(calendar.getTime());
		
		vitals.setModifyingUser(login.getSystemUser().getUsername());
		patient.setLastModifiedDate(calendar.getTime());
		
		encounter.setModifyingUser(login.getSystemUser().getUsername());
		encounter.setLastModifiedDate(calendar.getTime());
		
		//pharmEncounter intentionally left blank under the design-decision assumption that there will not be a time where someone goes back to edit medication prescribed or dispensed.  
		//get it right the first time.  no cheating. 
		//end housekeeping
		
		userSession = HibernateUtil.getSessionFactory().openSession();
		userSession.beginTransaction();
		
		userSession.update(patient);
		userSession.update(vitals);
		userSession.update(encounter);
		
		userSession.getTransaction().commit();
		userSession.close();
		
		patient = new Patient();
		vitals = new Vitals();
		encounter = new Encounter();
		
		//return to create.jsp after the create patient form has been submitted
		return "create";
	}
	
	public String saveNewEncounter()
	{
		//housekeeping
		patient.setCreatingUser(login.getSystemUser().getUsername());
		patient.setCreatedDate(calendar.getTime());
		patient.setModifyingUser(login.getSystemUser().getUsername());
		patient.setLastModifiedDate(calendar.getTime());
		
		vitals.setCreatingUser(login.getSystemUser().getUsername());
		vitals.setCreatedDate(calendar.getTime());
		vitals.setModifyingUser(login.getSystemUser().getUsername());
		vitals.setLastModifiedDate(calendar.getTime());
		
		encounter.setCreatingUser(login.getSystemUser().getUsername());
		encounter.setCreatedDate(calendar.getTime());
		encounter.setModifyingUser(login.getSystemUser().getUsername());
		encounter.setLastModifiedDate(calendar.getTime());
		
		pharmEncounter.setCreatingUser(login.getSystemUser().getUsername());
		pharmEncounter.setCreatedDate(calendar.getTime());
		//end housekeeping
		
		userSession = HibernateUtil.getSessionFactory().openSession();
		userSession.beginTransaction();
		
		userSession.save(patient);
		userSession.save(vitals);
		userSession.save(encounter);
		userSession.save(pharmEncounter);
		
		userSession.getTransaction().commit();
		userSession.close();
		
		patient = new Patient();
		vitals = new Vitals();
		encounter = new Encounter();
		pharmEncounter = new PharmacyEncounter();
		
		JOptionPane.showMessageDialog(null, "Record saved!", "Success!", JOptionPane.INFORMATION_MESSAGE);
		
		//return "create" to go back to create.jsp after the create patient form is submitted
		return "create";
	}

	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	
	public Vitals getVitals() {
		return vitals;
	}
	public void setVitals(Vitals vitals) {
		this.vitals = vitals;
	}
	
	public PharmacyEncounter getPharmEncounter() {
		return pharmEncounter;
	}
	public void setPharmEncounter(PharmacyEncounter pharmEncounter) {
		this.pharmEncounter = pharmEncounter;
	}
	
	public void setLogin(LoginBean login) {
		this.login = login;
	}
	public LoginBean getLogin()
	{
		return login;
	}
	
	public void setEncounter(Encounter encounter)
	{
		this.encounter = encounter;
	}
	public Encounter getEncounter()
	{
		return encounter;
	}

	@Override
	public void savePatient(Patient patient) {
		// TODO Auto-generated method stub
		
	}

	/**TODO: when searching for patient, Need to decide if we also populate the form with latest encounter or 
	 *       get a list of all previous encounters and display that , then once an encounter is 
	 *       clicked populate a form ( just output ) 
	 * */ 
	@Override
	public Patient getPatient(int patientId) {
	
		userSession = HibernateUtil.getSessionFactory().openSession();
		userSession.beginTransaction();
		
		@SuppressWarnings("unchecked")
		List<Patient> result = userSession.createQuery("from Patient where patientID='" + patientId + "'").list();
		userSession.getTransaction().commit();
		userSession.close();
		

		if (!result.isEmpty() )
			return result.get(0);
		return null;
	}

	@Override
	public Patient getPatientByLastName(String lastName) {
		
		userSession = HibernateUtil.getSessionFactory().openSession();
		userSession.beginTransaction();
		
		@SuppressWarnings("unchecked")
		List<Patient> result = userSession.createQuery("from Patient where patientID='" + lastName + "'").list();
		userSession.getTransaction().commit();
		userSession.close();
		if (!result.isEmpty() )
			return result.get(0);
		return null;
	}

	/**
	 * TODO: When searching for a patient , only one patient is displayed if found
	 *       do we want to search for all patients with specific last name for example
	 *       or specific residence 
	 */
	@Override
	public List<Patient> getAllPatients() {
		userSession = HibernateUtil.getSessionFactory().openSession();
		userSession.beginTransaction();
		
		@SuppressWarnings("unchecked")
		List<Patient> result = userSession.createQuery("from Patient ").list();
		userSession.getTransaction().commit();
		userSession.close();
		
		if (!result.isEmpty() )
			return result;
		return null;
	}

	@Override
	public void saveEncounter(Encounter encounter) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Encounter getEncounter(int encounterId) {
		userSession = HibernateUtil.getSessionFactory().openSession();
		userSession.beginTransaction();
		
		@SuppressWarnings("unchecked")
		List<Encounter> result = userSession.createQuery("from Encounter where encounterID='" + encounterId + "'").list();
		userSession.getTransaction().commit();
		userSession.close();
		if (!result.isEmpty() )
			return result.get(0);
		return null;
	}

	@Override
	public Encounter getEncounterByPatient(int patientId) {
		
		return null;
	}

	@Override
	public Encounter getEncounterByPatientName(String patientName) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Encounter> getAllEncounters(int patientId) {
		userSession = HibernateUtil.getSessionFactory().openSession();
		userSession.beginTransaction();
		
		@SuppressWarnings("unchecked")
		List<Encounter> result = userSession.createQuery("from Encounter where patientID='" + patientId + "'").list();
		userSession.getTransaction().commit();
		userSession.close();
		if (!result.isEmpty() )
			return result;
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Encounter> getAllEncounters(String patientName) {
		userSession = HibernateUtil.getSessionFactory().openSession();
		userSession.beginTransaction();
		
		List<Patient> tempPatient = userSession.createQuery("from Patient where lastName='" + patientName + "'").list();
		int tempPatientId;
		List<Encounter> result = null;
		
		// Check if patient exists in the system first, thus list is not empty
		if(!tempPatient.isEmpty())
		{
			tempPatientId = tempPatient.get(0).getPatientID();
			result = userSession.createQuery("from Encounter where patientID='" + tempPatientId + "'").list();
			
		}
		
		userSession.getTransaction().commit();
		userSession.close();
		if (!result.isEmpty() )
			return result;
		return null;
	}


}