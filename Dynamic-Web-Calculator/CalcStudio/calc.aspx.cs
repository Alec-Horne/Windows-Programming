using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wp_p3
{
    public partial class calc : System.Web.UI.Page
    {

        Assembly a = null;
        Type type1 = null;
        Type type2 = null;
        Type type3 = null;

        protected void Page_Init(object sender, EventArgs e)
        {
            Page.Title = "Calculator Creation Studio";
            Panel1.BorderStyle = BorderStyle.Outset;
            Panel1.BorderColor = System.Drawing.Color.LightGray;
            Panel2.BorderStyle = BorderStyle.Outset;
            Panel2.BorderColor = System.Drawing.Color.LightGray;

            //Set all label text boxes to read only so the user cannot edit them
            TextBox1.ReadOnly = true; TextBox2.ReadOnly = true; TextBox3.ReadOnly = true;
            TextBox4.ReadOnly = true; TextBox5.ReadOnly = true; TextBox6.ReadOnly = true;
            TextBox7.ReadOnly = true; TextBox8.ReadOnly = true; TextBox9.ReadOnly = true;
            TextBox10.ReadOnly = true; TextBox11.ReadOnly = true; TextBox12.ReadOnly = true;
            //Set all label text boxes to have a gray background
            TextBox1.BackColor = System.Drawing.Color.LightGray; TextBox2.BackColor = System.Drawing.Color.LightGray;
            TextBox3.BackColor = System.Drawing.Color.LightGray; TextBox4.BackColor = System.Drawing.Color.LightGray;
            TextBox5.BackColor = System.Drawing.Color.LightGray; TextBox6.BackColor = System.Drawing.Color.LightGray;
            TextBox7.BackColor = System.Drawing.Color.LightGray; TextBox8.BackColor = System.Drawing.Color.LightGray;
            TextBox9.BackColor = System.Drawing.Color.LightGray; TextBox10.BackColor = System.Drawing.Color.LightGray;
            TextBox11.BackColor = System.Drawing.Color.LightGray; TextBox12.BackColor = System.Drawing.Color.LightGray;

            TextBox[] methods1 = { TextBox3, TextBox4, TextBox5, TextBox6 };
            TextBox[] methods2 = { TextBox9, TextBox10, TextBox11, TextBox12 };

            //Load the assembly and get the types needed from it
            a = Assembly.Load("calc");
            type1 = a.GetType("wp_p3.SimpleCalc");
            type2 = a.GetType("wp_p3.ComplexCalc");
            type3 = a.GetType("wp_p3.cFloat");

            //Print Classes and their methods to the form            
            TextBox1.Text = ("Class Name : " + type1.Name);
            TextBox2.Text = ("Methods:");
            TextBox7.Text = ("Class Name : " + type2.Name);
            TextBox8.Text = ("Methods:");
            ShowMethods(type1, methods1);
            ShowMethods(type2, methods2);

            //Set all components in panel2 invisible initially
            scLabel.Visible = false; scLabel1.Visible = false; scLabel2.Visible = false;
            ccLabel.Visible = false; ccLabel1.Visible = false; ccLabel2.Visible = false;
            ccLabel3.Visible = false; ccLabel4.Visible = false; ccLabel5.Visible = false;
            ccLabel6.Visible = false; ccAnswerLabel.Visible = false; scAnswerLabel.Visible = false;
            scAddButton.Visible = false; scSubtractButton.Visible = false; scMultiplyButton.Visible = false;
            scDivideButton.Visible = false; ccAddButton.Visible = false; ccSubtractButton.Visible = false;
            ccMultiplyButton.Visible = false; ccDivideButton.Visible = false; scTextBox1.Visible = false;
            scTextBox2.Visible = false; ccTextBox1.Visible = false; ccTextBox2.Visible = false;
            ccTextBox3.Visible = false; ccTextBox4.Visible = false; Panel2.Visible = false;
        }

        // Method that accepts a type and TextBox[] variable to print the methods 
        // one-by-one in each TextBox in the TextBox array. Method will only print the
        // amount of methods as the array will hold. It will not throw an exception.
        private void ShowMethods(Type type, TextBox[] tb)
        {
            MethodInfo[] mi = type.GetMethods();
            for (int x = 0; x < tb.Length; x++)
            {
                var parameters = mi[x].GetParameters();
                var parameterDescriptions = string.Join(", ", mi[x].GetParameters()
                    .Select(y => y.ParameterType + "").ToArray());
                String s = String.Format("{0} ({1})", mi[x].Name,
                    parameterDescriptions);
                tb[x].Text += s;
            }
        }

        //Method that uses reflection to get the value of a private field of a class instance
        internal static object GetInstanceField(Type type, object obj, string fName)
        {
            BindingFlags bindFlags = BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic
                | BindingFlags.Static;
            FieldInfo f = type.GetField(fName, bindFlags);
            return f.GetValue(obj);
        }

        //Button that creates a calculator based on what methods the user selected
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Set all of panel2 invisible when the user creates a new calculator
            scLabel.Visible = false; scLabel1.Visible = false; scLabel2.Visible = false;
            ccLabel.Visible = false; ccLabel1.Visible = false; ccLabel2.Visible = false;
            ccLabel3.Visible = false; ccLabel4.Visible = false; ccLabel5.Visible = false;
            ccLabel6.Visible = false; ccAnswerLabel.Visible = false; scAnswerLabel.Visible = false;
            scAddButton.Visible = false; scSubtractButton.Visible = false; scMultiplyButton.Visible = false;
            scDivideButton.Visible = false; ccAddButton.Visible = false; ccSubtractButton.Visible = false;
            ccMultiplyButton.Visible = false; ccDivideButton.Visible = false; scTextBox1.Visible = false;
            scTextBox2.Visible = false; ccTextBox1.Visible = false; ccTextBox2.Visible = false;
            ccTextBox3.Visible = false; ccTextBox4.Visible = false; Panel2.Visible = false;

            //If there is a valid dll file loaded in the program
            if (a != null)
            {
                //Set panel 2 visible so user can see the controls
                Panel2.Visible = true;

                //If Simple Calculator fields for user input are not visible, make them visible
                if (!scLabel.Visible)
                {
                    if (CheckBox1.Checked || CheckBox2.Checked || CheckBox3.Checked || CheckBox4.Checked)
                    {
                        scLabel.Visible = true;
                        scLabel1.Visible = true;
                        scLabel2.Visible = true;
                        scTextBox1.Visible = true;
                        scTextBox2.Visible = true;
                    }
                }
                //If Complex Calculator fields for user input are not visible, make them visible
                if (!ccLabel.Visible)
                {
                    if (CheckBox5.Checked || CheckBox6.Checked || CheckBox7.Checked || CheckBox8.Checked)
                    {
                        ccLabel.Visible = true;
                        ccLabel1.Visible = true;
                        ccLabel2.Visible = true;
                        ccLabel3.Visible = true;
                        ccLabel4.Visible = true;
                        ccLabel5.Visible = true;
                        ccLabel6.Visible = true;
                        ccTextBox1.Visible = true;
                        ccTextBox2.Visible = true;
                        ccTextBox3.Visible = true;
                        ccTextBox4.Visible = true;
                    }
                }

                //Set buttons of methods user checked as visible
                if (CheckBox1.Checked)
                { scAddButton.Visible = true; }
                if (CheckBox2.Checked)
                { scSubtractButton.Visible = true; }
                if (CheckBox3.Checked)
                { scMultiplyButton.Visible = true; }
                if (CheckBox4.Checked)
                { scDivideButton.Visible = true; }
                if (CheckBox5.Checked)
                { ccAddButton.Visible = true; }
                if (CheckBox6.Checked)
                { ccSubtractButton.Visible = true; }
                if (CheckBox7.Checked)
                { ccMultiplyButton.Visible = true; }
                if (CheckBox8.Checked)
                { ccDivideButton.Visible = true; }
            }
        }

        protected void scAddButton_Click(object sender, EventArgs e)
        {
            //Get user input 
            String sNum1 = scTextBox1.Text;
            String sNum2 = scTextBox2.Text;
            
            //Test wether user input is valid, if invalid then inform them via answer label
            int test;
            if (int.TryParse(sNum1, out test) && int.TryParse(sNum2, out test))
            {
                //Store input into object array to use for invoking 
                Object[] parameterInfo = { Single.Parse(sNum1), Single.Parse(sNum2) };

                //Create instance of the type
                Object obj = Activator.CreateInstance(type1);

                //Get method that corresponds to this button
                MethodInfo method = type1.GetMethod("add");
                //Invoke method and store the result
                float result = (float)method.Invoke(obj, parameterInfo);

                //Print answer to the GUI for user
                scAnswerLabel.Visible = true;
                scAnswerLabel.Text = "The answer is " + result;
            }
            else {
                scAnswerLabel.Visible = true;
                scAnswerLabel.Text = "Input is not valid... Try again.";
            }
        }

        protected void scSubtractButton_Click(object sender, EventArgs e)
        {
            //Get user input 
            String sNum1 = scTextBox1.Text;
            String sNum2 = scTextBox2.Text;

            //Test wether user input is valid, if invalid then inform them via answer label
            int test;
            if (int.TryParse(sNum1, out test) && int.TryParse(sNum2, out test))
            {
                //Store input into object array to use for invoking 
                Object[] parameterInfo = { Single.Parse(sNum1), Single.Parse(sNum2) };

                //Create instance of the type
                Object obj = Activator.CreateInstance(type1);

                //Get method that corresponds to this button
                MethodInfo method = type1.GetMethod("subtract");
                //Invoke method and store the result
                float result = (float)method.Invoke(obj, parameterInfo);

                //Print answer to the GUI for user
                scAnswerLabel.Visible = true;
                scAnswerLabel.Text = "The answer is " + result;
            }
            else {
                scAnswerLabel.Visible = true;
                scAnswerLabel.Text = "Input is not valid... Try again.";
            }
        }

        protected void scMultiplyButton_Click(object sender, EventArgs e)
        {
            //Get user input 
            String sNum1 = scTextBox1.Text;
            String sNum2 = scTextBox2.Text;

            //Test wether user input is valid, if invalid then inform them via answer label
            int test;
            if (int.TryParse(sNum1, out test) && int.TryParse(sNum2, out test))
            {
                //Store input into object array to use for invoking 
                Object[] parameterInfo = { Single.Parse(sNum1), Single.Parse(sNum2) };

                //Create instance of the type
                Object obj = Activator.CreateInstance(type1);

                //Get method that corresponds to this button
                MethodInfo method = type1.GetMethod("multiply");
                //Invoke method and store the result
                float result = (float)method.Invoke(obj, parameterInfo);

                //Print answer to the GUI for user
                scAnswerLabel.Visible = true;
                scAnswerLabel.Text = "The answer is " + result;
            }
            else {
                scAnswerLabel.Visible = true;
                scAnswerLabel.Text = "Input is not valid... Try again.";
            }
        }

        protected void scDivideButton_Click(object sender, EventArgs e)
        {
            //Get user input 
            String sNum1 = scTextBox1.Text;
            String sNum2 = scTextBox2.Text;

            //Test wether user input is valid, if invalid then inform them via answer label
            int test;
            if (int.TryParse(sNum1, out test) && int.TryParse(sNum2, out test))
            {
                //Store input into object array to use for invoking 
                Object[] parameterInfo = { Single.Parse(sNum1), Single.Parse(sNum2) };

                if (sNum2 != "0")
                {
                    //Create instance of the type
                    Object obj = Activator.CreateInstance(type1);

                    //Get method that corresponds to this button
                    MethodInfo method = type1.GetMethod("divide");
                    //Invoke method and store the result
                    float result = (float)method.Invoke(obj, parameterInfo);

                    //Print answer to the GUI for user
                    scAnswerLabel.Visible = true;
                    scAnswerLabel.Text = "The answer is " + Math.Round(result, 2);
                }
                else {
                    scAnswerLabel.Visible = true;
                    scAnswerLabel.Text = "Division by zero is not allowed...";
                }
            }
            else {
                scAnswerLabel.Visible = true;
                scAnswerLabel.Text = "Input is not valid... Try again.";
            }
        }

        protected void ccAddButton_Click(object sender, EventArgs e)
        {
            //Get user input
            String sNum1 = ccTextBox1.Text;
            String sNum2 = ccTextBox2.Text;
            String sNum3 = ccTextBox3.Text;
            String sNum4 = ccTextBox4.Text;

            //Test wether user input is valid, if invalid then inform them via answer label
            int test;
            if (int.TryParse(sNum1, out test) && int.TryParse(sNum2, out test) &&
                int.TryParse(sNum3, out test) && int.TryParse(sNum4, out test))
            {

                //Create instances of the objects needed for parameters for the main object
                Object[] parameterInfo1 = { Single.Parse(sNum1), Single.Parse(sNum2) };
                Object[] parameterInfo2 = { Single.Parse(sNum3), Single.Parse(sNum4) };
                Object param1 = Activator.CreateInstance(type3, parameterInfo1);
                Object param2 = Activator.CreateInstance(type3, parameterInfo2);

                //Create instance of the type
                Object[] mainParameterInfo = { param1, param2 };
                Object obj = Activator.CreateInstance(type2);

                //Get method that corresponds to this button
                MethodInfo method = type2.GetMethod("add");

                //Invoke method and store the result
                Object result = method.Invoke(obj, mainParameterInfo);

                //Get fields from the result Object and store them for printing to screen
                float real = (float)GetInstanceField(type3, result, "real");
                float imag = (float)GetInstanceField(type3, result, "imag");

                //Print answer to the GUI for user
                ccAnswerLabel.Visible = true;
                if (imag > 0)
                    ccAnswerLabel.Text = "The answer is " + real + "+" + imag + "(i)";
                else
                    ccAnswerLabel.Text = "The answer is " + real + imag + "(i)";
            }
            else {
                ccAnswerLabel.Visible = true;
                ccAnswerLabel.Text = "Input is not valid... Try again.";
            }
        }

        protected void ccSubtractButton_Click(object sender, EventArgs e)
        {
            //Get user input
            String sNum1 = ccTextBox1.Text;
            String sNum2 = ccTextBox2.Text;
            String sNum3 = ccTextBox3.Text;
            String sNum4 = ccTextBox4.Text;

            //Test wether user input is valid, if invalid then inform them via answer label
            int test;
            if (int.TryParse(sNum1, out test) && int.TryParse(sNum2, out test) &&
                int.TryParse(sNum3, out test) && int.TryParse(sNum4, out test))
            {

                //Create instances of the objects needed for parameters for the main object
                Object[] parameterInfo1 = { Single.Parse(sNum1), Single.Parse(sNum2) };
                Object[] parameterInfo2 = { Single.Parse(sNum3), Single.Parse(sNum4) };
                Object param1 = Activator.CreateInstance(type3, parameterInfo1);
                Object param2 = Activator.CreateInstance(type3, parameterInfo2);

                //Create instance of the type
                Object[] mainParameterInfo = { param1, param2 };
                Object obj = Activator.CreateInstance(type2);

                //Get method that corresponds to this button
                MethodInfo method = type2.GetMethod("subtract");

                //Invoke method and store the result
                Object result = method.Invoke(obj, mainParameterInfo);

                //Get fields from the result Object and store them for printing to screen
                float real = (float)GetInstanceField(type3, result, "real");
                float imag = (float)GetInstanceField(type3, result, "imag");

                //Print answer to the GUI for user
                ccAnswerLabel.Visible = true;
                if (imag > 0)
                    ccAnswerLabel.Text = "The answer is " + real + "+" + imag + "(i)";
                else
                    ccAnswerLabel.Text = "The answer is " + real + imag + "(i)";
            }
            else {
                ccAnswerLabel.Visible = true;
                ccAnswerLabel.Text = "Input is not valid... Try again.";
            }
        }

        protected void ccMultiplyButton_Click(object sender, EventArgs e)
        {
            //Get user input
            String sNum1 = ccTextBox1.Text;
            String sNum2 = ccTextBox2.Text;
            String sNum3 = ccTextBox3.Text;
            String sNum4 = ccTextBox4.Text;

            //Test wether user input is valid, if invalid then inform them via answer label
            int test;
            if (int.TryParse(sNum1, out test) && int.TryParse(sNum2, out test) &&
                int.TryParse(sNum3, out test) && int.TryParse(sNum4, out test))
            {

                //Create instances of the objects needed for parameters for the main object
                Object[] parameterInfo1 = { Single.Parse(sNum1), Single.Parse(sNum2) };
                Object[] parameterInfo2 = { Single.Parse(sNum3), Single.Parse(sNum4) };
                Object param1 = Activator.CreateInstance(type3, parameterInfo1);
                Object param2 = Activator.CreateInstance(type3, parameterInfo2);

                //Create instance of the type
                Object[] mainParameterInfo = { param1, param2 };
                Object obj = Activator.CreateInstance(type2);

                //Get method that corresponds to this button
                MethodInfo method = type2.GetMethod("multiply");

                //Invoke method and store the result
                Object result = method.Invoke(obj, mainParameterInfo);

                //Get fields from the result Object and store them for printing to screen
                float real = (float)GetInstanceField(type3, result, "real");
                float imag = (float)GetInstanceField(type3, result, "imag");

                //Print answer to the GUI for user
                ccAnswerLabel.Visible = true;
                if (imag > 0)
                    ccAnswerLabel.Text = "The answer is " + real + "+" + imag + "(i)";
                else
                    ccAnswerLabel.Text = "The answer is " + real + imag + "(i)";
            }
            else {
                ccAnswerLabel.Visible = true;
                ccAnswerLabel.Text = "Input is not valid... Try again.";
            }
        }

        protected void ccDivideButton_Click(object sender, EventArgs e)
        {
            //Get user input
            String sNum1 = ccTextBox1.Text;
            String sNum2 = ccTextBox2.Text;
            String sNum3 = ccTextBox3.Text;
            String sNum4 = ccTextBox4.Text;

            //Test wether user input is valid, if invalid then inform them via answer label
            int test;
            if (int.TryParse(sNum1, out test) && int.TryParse(sNum2, out test) &&
                int.TryParse(sNum3, out test) && int.TryParse(sNum4, out test))
            {

                //If there is not division by zero then continue
                if (Single.Parse(sNum3) != 0 || Single.Parse(sNum4) != 0)
                {
                    //Create instances of the objects needed for parameters for the main object
                    Object[] parameterInfo1 = { Single.Parse(sNum1), Single.Parse(sNum2) };
                    Object[] parameterInfo2 = { Single.Parse(sNum3), Single.Parse(sNum4) };
                    Object param1 = Activator.CreateInstance(type3, parameterInfo1);
                    Object param2 = Activator.CreateInstance(type3, parameterInfo2);

                    //Create instance of the type
                    Object[] mainParameterInfo = { param1, param2 };
                    Object obj = Activator.CreateInstance(type2);

                    //Get method that corresponds to this button
                    MethodInfo method = type2.GetMethod("divide");

                    //Invoke method and store the result
                    Object result = method.Invoke(obj, mainParameterInfo);

                    //Get fields from the result Object and store them for printing to screen
                    float real = (float)GetInstanceField(type3, result, "real");
                    float imag = (float)GetInstanceField(type3, result, "imag");

                    //Print answer to the GUI for user
                    ccAnswerLabel.Visible = true;
                    if (imag > 0)
                        ccAnswerLabel.Text = "The answer is " + Math.Round(real, 2) + 
                            "+" + Math.Round(imag, 2) + "(i)";
                    else
                        ccAnswerLabel.Text = "The answer is " + Math.Round(real, 2) + 
                            Math.Round(imag, 2) + "(i)";
                }
                else {
                    ccAnswerLabel.Visible = true;
                    ccAnswerLabel.Text = "Division by zero is not allowed...";
                }
            }
            else {
                ccAnswerLabel.Visible = true;
                ccAnswerLabel.Text = "Input is not valid... Try again.";
            }
        }

    }
}