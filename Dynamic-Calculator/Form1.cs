using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Reflection;
using System.Runtime.Remoting;
using System.Windows.Forms;

namespace WP_Project2
{
    public partial class Form1 : Form
    {

        Type[] types = null;
        Assembly a = null;

        public Form1()
        {
            InitializeComponent();
        }


        private void openToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TextBox[] methods1 = { textBox3, textBox4, textBox5, textBox6 };
            TextBox[] methods2 = { textBox9, textBox10, textBox11, textBox12 };

            fileDialog.Filter = "DLL Files (.dll)|*.dll";
            fileDialog.FilterIndex = 1;
            if (fileDialog.ShowDialog() == DialogResult.OK)
            {
                a = Assembly.LoadFrom(fileDialog.FileName);
                types = a.GetTypes();
                //Print Classes and their methods to the form
                textBox1.Text += ("Class Name : " + types[0].Name);
                textBox2.Text += ("Methods:");
                textBox7.Text += ("Class Name : " + types[1].Name);
                textBox8.Text += ("Methods:");
                ShowMethods(types[0], methods1);
                ShowMethods(types[1], methods2);
            }

        }

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

        private void calcCreateButton_Click(object sender, EventArgs e)
        {
            //Set everything invisible on panel 2 when user clicks button to create a new calculator
            scButton1.Visible = false; scButton2.Visible = false; scButton3.Visible = false;
            scButton4.Visible = false;
            ccButton1.Visible = false; ccButton2.Visible = false; ccButton3.Visible = false;
            ccButton4.Visible = false;
            titleLbl1.Visible = false; titleLbl2.Visible = false; titleLbl3.Visible = false;
            titleLbl4.Visible = false;
            numLbl1.Visible = false; numLbl2.Visible = false; numLbl3.Visible = false;
            numLbl4.Visible = false; numLbl5.Visible = false; numLbl6.Visible = false;
            numTextBox1.Visible = false; numTextBox2.Visible = false; numTextBox3.Visible = false;
            numTextBox4.Visible = false; numTextBox5.Visible = false; numTextBox6.Visible = false;
            scAnswerLbl.Visible = false; ccAnswerLbl.Visible = false;

            //If the user has opened an assembly or dll file
            if (a != null)
            {
                //If Simple Calculator fields for user input are not visible, make them visible
                if (!titleLbl1.Visible)
                {
                    if (checkBox1.Checked || checkBox2.Checked || checkBox3.Checked || checkBox4.Checked)
                    {
                        titleLbl1.Visible = true;
                        numLbl1.Visible = true;
                        numLbl2.Visible = true;
                        numTextBox1.Visible = true;
                        numTextBox2.Visible = true;
                    }
                }
                //If Complex Calculator fields for user input are not visible, make them visible
                if (!titleLbl2.Visible)
                {
                    if (checkBox5.Checked || checkBox6.Checked || checkBox7.Checked || checkBox8.Checked)
                    {
                        titleLbl2.Visible = true;
                        titleLbl3.Visible = true;
                        titleLbl4.Visible = true;
                        numLbl3.Visible = true;
                        numLbl4.Visible = true;
                        numLbl5.Visible = true;
                        numLbl6.Visible = true;
                        numTextBox3.Visible = true;
                        numTextBox4.Visible = true;
                        numTextBox5.Visible = true;
                        numTextBox6.Visible = true;
                    }
                }

                //Set buttons of methods user checked as visible
                if (checkBox1.Checked)
                {
                    scButton1.Visible = true;
                    buttonPanel1.Controls.Add(scButton1);
                }
                if (checkBox2.Checked)
                {
                    scButton2.Visible = true;
                    buttonPanel1.Controls.Add(scButton2);
                }
                if (checkBox3.Checked)
                {
                    scButton3.Visible = true;
                    buttonPanel1.Controls.Add(scButton3);
                }
                if (checkBox4.Checked)
                {
                    scButton4.Visible = true;
                    buttonPanel1.Controls.Add(scButton4);
                }
                if (checkBox5.Checked)
                {
                    ccButton1.Visible = true;
                    buttonPanel2.Controls.Add(ccButton1);
                }
                if (checkBox6.Checked)
                {
                    ccButton2.Visible = true;
                    buttonPanel2.Controls.Add(ccButton2);
                }
                if (checkBox7.Checked)
                {
                    ccButton3.Visible = true;
                    buttonPanel2.Controls.Add(ccButton3);
                }
                if (checkBox8.Checked)
                {
                    ccButton4.Visible = true;
                    buttonPanel2.Controls.Add(ccButton4);
                }
            }
        }

        private void scButton1_Click(object sender, EventArgs e)
        {
            //Get user input 
            String sNum1 = numTextBox1.Text;
            String sNum2 = numTextBox2.Text;
            //Store input into object array to use for invoking 
            Object[] parameterInfo = { Convert.ToInt32(sNum1), Convert.ToInt32(sNum2) };

            //Create instance of the type
            Object obj = Activator.CreateInstance(types[0]);

            //Get method that corresponds to this button
            MethodInfo method = types[0].GetMethod("add");
            //Invoke method and store the result
            int result = (int)method.Invoke(obj, parameterInfo);

            //Print answer to the GUI for user
            scAnswerLbl.Text = "";
            scAnswerLbl.Text = "The answer is " + result;
            scAnswerLbl.Visible = true;
        }

        private void scButton2_Click(object sender, EventArgs e)
        {
            //Get user input 
            String sNum1 = numTextBox1.Text;
            String sNum2 = numTextBox2.Text;
            //Store input into object array to use for invoking 
            Object[] parameterInfo = { Convert.ToInt32(sNum1), Convert.ToInt32(sNum2) };

            //Create instance of the type
            Object obj = Activator.CreateInstance(types[0]);

            //Get method that corresponds to this button
            MethodInfo method = types[0].GetMethod("subtract");
            //Invoke method and store the result
            int result = (int)method.Invoke(obj, parameterInfo);

            //Print answer to the GUI for user
            scAnswerLbl.Text = "";
            scAnswerLbl.Text = "The answer is " + result;
            scAnswerLbl.Visible = true;
        }

        private void scButton3_Click(object sender, EventArgs e)
        {
            //Get user input 
            String sNum1 = numTextBox1.Text;
            String sNum2 = numTextBox2.Text;
            //Store input into object array to use for invoking 
            Object[] parameterInfo = { Convert.ToInt32(sNum1), Convert.ToInt32(sNum2) };

            //Create instance of the type
            Object obj = Activator.CreateInstance(types[0]);

            //Get method that corresponds to this button
            MethodInfo method = types[0].GetMethod("multiply");
            //Invoke method and store the result
            int result = (int)method.Invoke(obj, parameterInfo);

            //Print answer to the GUI for user
            scAnswerLbl.Text = "";
            scAnswerLbl.Text = "The answer is " + result;
            scAnswerLbl.Visible = true;
        }

        private void scButton4_Click(object sender, EventArgs e)
        {
            //Get user input 
            String sNum1 = numTextBox1.Text;
            String sNum2 = numTextBox2.Text;
            //Store input into object array to use for invoking 
            Object[] parameterInfo = { Convert.ToInt32(sNum1), Convert.ToInt32(sNum2) };

            //Create instance of the type
            Object obj = Activator.CreateInstance(types[0]);

            //Get method that corresponds to this button
            MethodInfo method = types[0].GetMethod("divide");
            //Invoke method and store the result
            double doubleResult = (double)method.Invoke(obj, parameterInfo);
            int result = Convert.ToInt32(doubleResult);

            //Print answer to the GUI for user
            scAnswerLbl.Text = "";
            scAnswerLbl.Text = "The answer is " + result;
            scAnswerLbl.Visible = true;
        }

        private void ccButton1_Click(object sender, EventArgs e)
        {
            //Get user input 
            String sNum1 = numTextBox3.Text;
            String sNum2 = numTextBox4.Text;
            String sNum3 = numTextBox5.Text;
            String sNum4 = numTextBox6.Text;
            //Store input into object arrays to use for invoking 
            Object[] parameterInfo1 = { Convert.ToInt32(sNum1), Convert.ToInt32(sNum3) };
            Object[] parameterInfo2 = { Convert.ToInt32(sNum2), Convert.ToInt32(sNum4) };

            //Create instance of the type
            Object obj = Activator.CreateInstance(types[1]);

            //Get method that corresponds to this button
            MethodInfo method1 = types[1].GetMethod("addReal");
            MethodInfo method2 = types[1].GetMethod("addImag");
            //Invoke method and store the result
            int realResult = (int)method1.Invoke(obj, parameterInfo1);
            int imagResult = (int)method2.Invoke(obj, parameterInfo2);

            //Print answer to the GUI for user
            ccAnswerLbl.Text = "";
            ccAnswerLbl.Text = "The answer is " + realResult + " + (i)" + imagResult;
            ccAnswerLbl.Visible = true;
        }

        private void ccButton2_Click(object sender, EventArgs e)
        {
            //Get user input 
            String sNum1 = numTextBox3.Text;
            String sNum2 = numTextBox4.Text;
            String sNum3 = numTextBox5.Text;
            String sNum4 = numTextBox6.Text;
            //Store input into object arrays to use for invoking 
            Object[] parameterInfo1 = { Convert.ToInt32(sNum1), Convert.ToInt32(sNum3) };
            Object[] parameterInfo2 = { Convert.ToInt32(sNum2), Convert.ToInt32(sNum4) };

            //Create instance of the type
            Object obj = Activator.CreateInstance(types[1]);

            //Get method that corresponds to this button
            MethodInfo method1 = types[1].GetMethod("subtractReal");
            MethodInfo method2 = types[1].GetMethod("subtractImag");
            //Invoke method and store the result
            int realResult = (int)method1.Invoke(obj, parameterInfo1);
            int imagResult = (int)method2.Invoke(obj, parameterInfo2);

            //Print answer to the GUI for user
            ccAnswerLbl.Text = "";
            ccAnswerLbl.Text = "The answer is " + realResult + " + (i)" + imagResult;
            ccAnswerLbl.Visible = true;
        }

        private void ccButton3_Click(object sender, EventArgs e)
        {
            //Get user input 
            String sNum1 = numTextBox3.Text;
            String sNum2 = numTextBox4.Text;
            String sNum3 = numTextBox5.Text;
            String sNum4 = numTextBox6.Text;
            //Store input into object arrays to use for invoking 
            Object[] parameterInfo1 = { Convert.ToInt32(sNum1), Convert.ToInt32(sNum3) };
            Object[] parameterInfo2 = { Convert.ToInt32(sNum2), Convert.ToInt32(sNum4) };

            //Create instance of the type
            Object obj = Activator.CreateInstance(types[1]);

            //Get method that corresponds to this button
            MethodInfo method1 = types[1].GetMethod("multiplyReal");
            MethodInfo method2 = types[1].GetMethod("multiplyImag");
            //Invoke method and store the result
            int realResult = (int)method1.Invoke(obj, parameterInfo1);
            int imagResult = (int)method2.Invoke(obj, parameterInfo2);

            //Print answer to the GUI for user
            ccAnswerLbl.Text = "";
            ccAnswerLbl.Text = "The answer is " + realResult + " + (i)" + imagResult;
            ccAnswerLbl.Visible = true;
        }

        private void ccButton4_Click(object sender, EventArgs e)
        {
            //Get user input 
            String sNum1 = numTextBox3.Text;
            String sNum2 = numTextBox4.Text;
            String sNum3 = numTextBox5.Text;
            String sNum4 = numTextBox6.Text;
            //Store input into object arrays to use for invoking 
            Object[] parameterInfo1 = { Convert.ToInt32(sNum1), Convert.ToInt32(sNum3) };
            Object[] parameterInfo2 = { Convert.ToInt32(sNum2), Convert.ToInt32(sNum4) };

            //Create instance of the type
            Object obj = Activator.CreateInstance(types[1]);

            //Get method that corresponds to this button
            MethodInfo method1 = types[1].GetMethod("divideReal");
            MethodInfo method2 = types[1].GetMethod("divideImag");
            //Invoke method and store the result
            double doubleRealResult = (double)method1.Invoke(obj, parameterInfo1);
            double doubleImagResult = (double)method2.Invoke(obj, parameterInfo2);
            int realResult = Convert.ToInt32(doubleRealResult);
            int imagResult = Convert.ToInt32(doubleImagResult);

            //Print answer to the GUI for user
            ccAnswerLbl.Text = "";
            ccAnswerLbl.Text = "The answer is " + realResult + " + (i)" + imagResult;
            ccAnswerLbl.Visible = true;
        }
    }
}
